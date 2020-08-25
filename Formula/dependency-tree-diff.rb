class DependencyTreeDiff < Formula
  desc "An intelligent diff tool for the output of Gradle's dependencies task"
  homepage "https://github.com/JakeWharton/dependency-tree-diff"
  url "https://github.com/JakeWharton/dependency-tree-diff/releases/download/1.1.0/dependency-tree-diff.jar"
  version "1.1.0"
  sha256 "5b09de8b3323f8c0be117a4223e4054afaddb2a48b39f134b00c8e9466ab014f"

  bottle :unneeded

  depends_on "openjdk"

  def install
    libexec.install "dependency-tree-diff.jar"
    bin.write_jar_script libexec/"dependency-tree-diff.jar", "dependency-tree-diff"
  end
end
