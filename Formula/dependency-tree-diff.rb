class DependencyTreeDiff < Formula
  desc "An intelligent diff tool for the output of Gradle's dependencies task"
  homepage "https://github.com/JakeWharton/dependency-tree-diff"
  url "https://github.com/JakeWharton/dependency-tree-diff/releases/download/1.0.0/dependency-tree-diff.jar"
  sha256 "6a7da7cbacf82ddf997a5ddeb2ce4779b2197640272309e52c7253ce1cbfd531"

  bottle :unneeded

  depends_on "openjdk"

  def install
    libexec.install "dependency-tree-diff.jar"
    bin.write_jar_script libexec/"dependency-tree-diff.jar", "dependency-tree-diff"
  end
end
