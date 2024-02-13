class Diffuse < Formula
  desc "A tool for diffing APKs, AABs, AARs, and JARs"
  homepage "https://github.com/JakeWharton/diffuse"
  url "https://github.com/JakeWharton/diffuse/releases/download/0.2.0/diffuse-0.2.0.zip"
  version "0.2.0"
  sha256 "60d619373c46a5d06b8126c1d61e0adc18b72f2cbb9245ef920d3387e44b86cf"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"diffuse").write_env_script libexec/"bin/diffuse",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/diffuse --help")
    assert_includes output, "Usage: diffuse"
  end
end
