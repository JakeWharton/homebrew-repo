class PlexAutoTrash < Formula
  desc "Automatically empty the trash in all of your Plex libraries."
  homepage "https://github.com/JakeWharton/plex-auto-trash"
  url "https://github.com/JakeWharton/plex-auto-trash/releases/download/1.0.0/plex-auto-trash.zip"
  version "1.0.0"
  sha256 "8d2f8675d8647bfc182267bf181f098af4b45ba44ceaee62ee9b0b4570b91679"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"plex-auto-trash").write_env_script libexec/"bin/plex-auto-trash",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/plex-auto-trash --help")
    assert_includes output, "Usage: plex-auto-trash"
  end
end
