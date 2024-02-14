class Diffuse < Formula
  desc "A tool for diffing APKs, AABs, AARs, and JARs"
  homepage "https://github.com/JakeWharton/diffuse"
  url "https://github.com/JakeWharton/diffuse/releases/download/0.2.0/diffuse-0.2.0.zip"
  version "0.2.0"
  sha256 "ddc121691effa716c909fb4571f19f20ba5d2f16099c1b5ce44f2657a9dec66b"

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
