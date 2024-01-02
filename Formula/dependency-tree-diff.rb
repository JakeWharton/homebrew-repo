class DependencyTreeDiff < Formula
  desc "An intelligent diff tool for the output of Gradle's dependencies task"
  homepage "https://github.com/JakeWharton/dependency-tree-diff"
  url "https://github.com/JakeWharton/dependency-tree-diff/releases/download/1.2.1/dependency-tree-diff.jar"
  version "1.2.1"
  sha256 "f6c84d5ce8beb3277103fb8235071dd8bc69a7cde75239f636a7c8293ff0c865"

  depends_on "openjdk"

  def install
    libexec.install "dependency-tree-diff.jar"
    bin.write_jar_script libexec/"dependency-tree-diff.jar", "dependency-tree-diff"
  end
end
