class DependencyTreeDiff < Formula
  desc "An intelligent diff tool for the output of Gradle's dependencies task"
  homepage "https://github.com/JakeWharton/dependency-tree-diff"
  url "https://github.com/JakeWharton/dependency-tree-diff/releases/download/1.2.0/dependency-tree-diff.jar"
  version "1.2.0"
  sha256 "5d383b4413864c2437818ccdd71b9995e9983482da33382aad6dd62885e90bbd"

  depends_on "openjdk"

  def install
    libexec.install "dependency-tree-diff.jar"
    bin.write_jar_script libexec/"dependency-tree-diff.jar", "dependency-tree-diff"
  end
end
