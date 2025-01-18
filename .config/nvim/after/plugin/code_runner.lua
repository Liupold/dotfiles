require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = {
        "cd $dir &&",
        "python3 -u $fileName",
    },
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    gnuplot = "gnuplot",
    tex = {
      "cd $dir &&",
      "rubber --inplace --ps $fileName &&",
    },
    matlab = "octave -q",
  }
})
