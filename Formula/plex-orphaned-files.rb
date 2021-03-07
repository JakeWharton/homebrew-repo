class PlexOrphanedFiles < Formula
  desc "Find files in your Plex libraries which are not indexed by Plex."
  homepage "https://github.com/JakeWharton/plex-orphaned-files"
  url "https://github.com/JakeWharton/plex-orphaned-files/releases/download/1.0.0/plex-orphaned-files.zip"
  version "1.0.0"
  sha256 "9589e0926adfbc67b3e6590a2ff241ced013889b950ac73e4a2c89a760e109a4"

  bottle :unneeded

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"plex-orphaned-files").write_env_script libexec/"bin/plex-orphaned-files",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/plex-orphaned-files --help")
    assert_includes output, "Usage: plex-orphaned-files"
  end
end
