class Dodo < Formula
  desc "Synchronize your Twitter timeline to a local database for archival and search"
  homepage "https://github.com/JakeWharton/dodo"
  url "https://github.com/JakeWharton/dodo/releases/download/1.1.0/dodo.zip"
  version "1.1.0"
  sha256 "1225b00fd272da865197a5170b5f166907074beeca5bdecbabf1bd78e98ca7a9"

  bottle :unneeded

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"dodo").write_env_script libexec/"bin/dodo",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/dodo --help")
    assert_includes output, "Usage: dodo"
  end
end
