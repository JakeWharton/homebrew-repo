class DockerfileShebang < Formula
  desc "Treat your Dockerfiles as self-contained, editable scripts."
  homepage "https://github.com/JakeWharton/dockerfile-shebang"
  url "https://github.com/JakeWharton/dockerfile-shebang/releases/download/1.1.0/dockerfile-shebang"
  version "1.1.0"
  sha256 "51016778b03e570afed6e0b878d0083525d7c8b5e44560ed15a04bb8a0d1f503"
  head "https://github.com/JakeWharton/dockerfile-shebang.git"

  bottle :unneeded

  def install
    bin.install "dockerfile-shebang" => "dockerfile-shebang"
  end
end
