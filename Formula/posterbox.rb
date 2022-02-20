class Posterbox < Formula
  desc "Rotating display of Movie and TV posters"
  homepage "https://github.com/JakeWharton/PosterBox"
  url "https://github.com/JakeWharton/PosterBox/releases/download/0.1.2/posterbox.zip"
  version "0.1.2"
  sha256 "85bf527712795b23f0f1455eb35518031f7167adac66eb480788590d3499a232"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"posterbox").write_env_script libexec/"bin/posterbox",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/posterbox --help")
    assert_includes output, "Usage: posterbox"
  end
end
