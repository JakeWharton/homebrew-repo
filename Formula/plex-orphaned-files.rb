class PlexOrphanedFiles < Formula
  desc "Find files in your Plex libraries which are not indexed by Plex."
  homepage "https://github.com/JakeWharton/plex-orphaned-files"
  url "https://github.com/JakeWharton/plex-orphaned-files/releases/download/1.1.0/plex-orphaned-files.zip"
  version "1.1.0"
  sha256 "c4845ea207e6d300e7010dd39eec0223b08a991362c6ded9bd94c62dca7bcc8b"

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
