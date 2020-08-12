class DependencyWatch < Formula
  desc "Script to wait for an artifact to appear on Maven Central or to monitor coordinates for new versions"
  homepage "https://github.com/JakeWharton/dependency-watch"
  url "https://github.com/JakeWharton/dependency-watch/releases/download/0.3.0/dependency-watch.zip"
  version "0.3.0"
  sha256 "be1c18e3ce775aaf28a3d6b4cc54fa41b173db20b14df6247e38aadeb8652b6d"

  bottle :unneeded

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"dependency-watch").write_env_script libexec/"bin/dependency-watch",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/dependency-watch --help")
    assert_includes output, "Usage: dependency-watch"
  end
end
