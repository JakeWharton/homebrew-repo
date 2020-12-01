class DockerfileShebang < Formula
  desc "Treat your Dockerfiles as self-contained, editable scripts."
  homepage "https://github.com/JakeWharton/dockerfile-shebang"
  url "https://github.com/JakeWharton/dockerfile-shebang/releases/download/1.0.0/dockerfile-shebang"
  version "1.0.0"
  sha256 "f9f65b41341f4441dc7005b50cf1b9640d3121614b4138ea02eb46ce02767510"
  head "https://github.com/JakeWharton/dockerfile-shebang.git"

  bottle :unneeded

  def install
    bin.install "dockerfile-shebang" => "dockerfile-shebang"
  end
end
