class SingularSolution < Formula
  desc "Keep your Twitter follower count at zero by blocking and then quickly unblocking any new followers"
  homepage "https://github.com/JakeWharton/singular-solution"
  url "https://github.com/JakeWharton/dodo/releases/download/1.0.0/singular-solution.zip"
  version "1.0.0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"dodo").write_env_script libexec/"bin/singular-solution",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/singular-solution --help")
    assert_includes output, "Usage: singular-solution"
  end
end
