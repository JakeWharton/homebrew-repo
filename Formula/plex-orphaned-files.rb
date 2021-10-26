class PlexOrphanedFiles < Formula
  desc "Find files in your Plex libraries which are not indexed by Plex."
  homepage "https://github.com/JakeWharton/plex-orphaned-files"
  url "https://github.com/JakeWharton/plex-orphaned-files/releases/download/1.1.1/plex-orphaned-files.zip"
  version "1.1.1"
  sha256 "909e5f59f2a4ae1aa284f6c29182f43ed1c42a30be89809652c2fd1604066f83"

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
