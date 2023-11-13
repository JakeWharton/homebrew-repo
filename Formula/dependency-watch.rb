class DependencyWatch < Formula
  desc "Script to wait for an artifact to appear on Maven Central or to monitor coordinates for new versions"
  homepage "https://github.com/JakeWharton/dependency-watch"
  url "https://github.com/JakeWharton/dependency-watch/releases/download/0.5.0/dependency-watch.zip"
  version "0.5.0"
  sha256 "d8d4ccd9a6f6ee14b46e0f14b07750aae00ab49651949f7c9ddbc823e68ff000"

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
