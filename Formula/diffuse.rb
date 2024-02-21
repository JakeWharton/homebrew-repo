class Diffuse < Formula
  desc "A tool for diffing APKs, AABs, AARs, and JARs"
  homepage "https://github.com/JakeWharton/diffuse"
  url "https://github.com/JakeWharton/diffuse/releases/download/0.3.0/diffuse-0.3.0.zip"
  version "0.3.0"
  sha256 "e297903f8db124e3edb9afe5a92564475b166a7a0acd41ee9e0de745fd772eb3"

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
