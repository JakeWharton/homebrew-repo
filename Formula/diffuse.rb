class Diffuse < Formula
  desc "A tool for diffing APKs, AABs, AARs, and JARs"
  homepage "https://github.com/JakeWharton/diffuse"
  url "https://github.com/JakeWharton/diffuse/releases/download/0.1.0/diffuse-0.1.0-binary.jar"
  version "0.1.0"
  sha256 "60d619373c46a5d06b8126c1d61e0adc18b72f2cbb9245ef920d3387e44b86cf"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "diffuse-#{version}-binary.jar", "diffuse.jar"
    libexec.install "diffuse.jar"
    bin.write_jar_script libexec/"diffuse.jar", "diffuse"
  end

  test do
    output = shell_output("#{bin}/diffuse --help")
    assert_includes output, "Usage: diffuse"
  end
end
