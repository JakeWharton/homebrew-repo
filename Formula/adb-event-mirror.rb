class AdbEventMirror < Formula
  desc "Mirror the touch/key/button events of one device onto one or more other devices in real-time"
  homepage "https://github.com/JakeWharton/adb-event-mirror"
  url "https://github.com/JakeWharton/adb-event-mirror/releases/download/1.0.0/adb-event-mirror.main.kts"
  version "1.0.0"
  sha256 "ed1e09ac335e73ed193febbfd7748dfbe234c3f02c8054983fa46df5b3589280"

  bottle :unneeded

  depends_on "kotlin"

  def install
    system "chmod", "+x", "adb-event-mirror.main.kts"
    libexec.install "adb-event-mirror.main.kts"
    (bin/"adb-event-mirror").write_env_script libexec/"adb-event-mirror.main.kts", {}
  end

  test do
    output = shell_output("#{bin}/adb-event-mirror --help")
    assert_includes output, "Usage: adb-event-mirror"
  end
end
