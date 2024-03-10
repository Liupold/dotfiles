--Very simple mpv script that disables video on YouTube videos
--and instead shows the video thumbnail.
--Because there is no toggle for this I recommend only calling
--the script via the "--scripts-append" flag unless you always
--want to just see video thumbnails.

--Set this to 1 if you use Windows
windows = 0

function thumbnail_as_cover()
	--check if the video is from YouTube
	path = mp.get_property("path")
  thumb_vid = mp.get_property("audio-display")
	is_yt = string.find(path, "www.youtube.com")
  -- print(thumb_vid)
	if (is_yt == nil )
	then
		return
	elseif (thumb_vid == "external-first") then
		print("YouTube video detected! Using thumbnail as cover!")
		--generate a url to the thumbnail file
		vid_id = mp.get_property("filename")
		vid_id = string.gsub(vid_id, "watch%?v=", "") -- Strip possible prefix.
		vid_id = string.sub(vid_id, 1, 11) -- Strip possible suffix.
		thumb_url_maxres1 = string.format("https://i.ytimg.com/vi_webp/%s/maxresdefault.webp", vid_id)
		thumb_url_maxres2 = string.format("https://i.ytimg.com/vi/%s/maxresdefault.jpg", vid_id)
		thumb_url_sd = string.format("https://i.ytimg.com/vi_webp/%s/sddefault.webp", vid_id)
		thumb_url_hq = string.format("https://i.ytimg.com/vi_webp/%s/hqdefault.webp", vid_id)

		--ensuring we only grab the audio
		mp.set_property("ytdl-format", "bestaudio")

		if ( windows == 1 )
		then
			--set the yt thumbnail as cover art (Windows)
			thumb_urls = thumb_url_maxres1 .. ";" .. thumb_url_maxres2 .. ";" .. thumb_url_sd .. ";" .. thumb_url_hq
			mp.set_property("cover-art-files", thumb_urls)
		else
			--set the yt thumbnail as cover art (Linux)
			thumb_urls = thumb_url_maxres1 .. ":" .. thumb_url_maxres2 .. ":" .. thumb_url_sd .. ":" .. thumb_url_hq
			thumb_urls = string.gsub(thumb_urls, "://", [[\://]])
			mp.set_property("cover-art-files", thumb_urls)
		end
	end
end

--start on every new file in a playlist
mp.register_event("start-file", thumbnail_as_cover)
