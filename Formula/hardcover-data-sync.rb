class HardcoverDataSync < Formula
  desc "Script to sync all user data from Hardcover to a local directory"
  homepage "https://github.com/JakeWharton/hardcover-data-sync"
  url "https://github.com/JakeWharton/hardcover-data-sync/releases/download/0.1.0/hardcover-data-sync.zip"
  version "0.1.0"
  sha256 "8e22ac3a18fafa4eea261bda71c8bd66787b0c13a159c06d20aa0623192abf46"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"hardcover-data-sync").write_env_script libexec/"bin/hardcover-data-sync",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/hardcover-data-sync --help")
    assert_includes output, "Usage: hardcover-data-sync"
  end
end
