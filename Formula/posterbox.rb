class PosterBox < Formula
  desc "Rotating display of Movie and TV posters"
  homepage "https://github.com/JakeWharton/PosterBox"
  url "https://github.com/JakeWharton/PosterBox/releases/download/0.1.0/posterbox.zip"
  version "0.1.0"
  sha256 "ca91ffc006ef0cb74d8fd5fd9a7fc5ba40660a09cfbdb754ab23379b6680491a"

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
