class SingularSolution < Formula
  desc "Auto-block and unblock new Twitter followers to keep count zero"
  homepage "https://github.com/JakeWharton/singular-solution"
  url "https://github.com/JakeWharton/singular-solution/releases/download/2.0.0/singular-solution.zip"
  sha256 "e42262a1e46f120091c1cfd34b6aba1e9ffb05ca51c9d9251f2df7cd88cf2adf"

  depends_on "openjdk"

  def install
    rm(Dir["bin/*.bat"])
    libexec.install %w[bin lib]
    (bin/"singular-solution").write_env_script libexec/"bin/singular-solution",
      JAVA_HOME: "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/singular-solution --help")
    assert_includes output, "Usage: singular-solution"
  end
end
