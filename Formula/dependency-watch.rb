class DependencyWatch < Formula
  desc "Script to wait for an artifact to appear on Maven Central or to monitor coordinates for new versions"
  homepage "https://github.com/JakeWharton/dependency-watch"
  url "https://github.com/JakeWharton/dependency-watch/releases/download/0.4.1/dependency-watch.zip"
  version "0.4.1"
  sha256 "87501637b2499c62b4de89cc5a053f164126dcaf4d4d2a77ad5ed3a225dfc59e"

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
