class DockerfileShebang < Formula
  desc "Treat your Dockerfiles as self-contained, editable scripts."
  homepage "https://github.com/JakeWharton/dockerfile-shebang"
  url "https://github.com/JakeWharton/dockerfile-shebang/releases/download/1.2.0/dockerfile-shebang"
  version "1.2.0"
  sha256 "a50acd031bc3fd3c2fa7106b8128f91bf56221ffcf41dfbfed2e6ee282a0d043"
  head "https://github.com/JakeWharton/dockerfile-shebang.git"

  bottle :unneeded

  def install
    bin.install "dockerfile-shebang" => "dockerfile-shebang"
  end
end
