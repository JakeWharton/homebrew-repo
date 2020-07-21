class DependencyWatch < Formula
  desc "Script to wait for an artifact to appear on Maven Central or to monitor coordinates for new versions"
  homepage "https://github.com/JakeWharton/dependency-watch"
  url "https://github.com/JakeWharton/dependency-watch/releases/download/0.1.0/dependency-watch.zip"
  sha256 "21f223597b1db58f2588282033d43cdf69faa16edbfaf0daf02aceb73d1e802b"

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
