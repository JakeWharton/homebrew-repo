class AsciinemaVsync < Formula
  desc "Batch the commands inside an Asciinema JSON file to reduce flickering"
  homepage "https://github.com/JakeWharton/asciinema-vsync"
  url "https://github.com/JakeWharton/asciinema-vsync/releases/download/1.0.0/asciinema-vsync.jar"
  version "1.0.0"
  sha256 "dce0570141755f17be1a73a6c7bd79d2deb2f63c96ce1be9a44af308ea0fa23f"

  bottle :unneeded

  depends_on "openjdk"

  def install
    libexec.install "asciinema-vsync.jar"
    bin.write_jar_script libexec/"asciinema-vsync.jar", "asciinema-vsync"
  end
end
