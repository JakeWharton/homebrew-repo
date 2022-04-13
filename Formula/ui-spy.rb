class UiSpy < Formula
  desc "Monitor products on the Ubiquiti Store and receive notifications when their availability changes."
  homepage "https://github.com/JakeWharton/ui-spy"
  url "https://github.com/JakeWharton/ui-spy/releases/download/0.2.0/ui-spy.zip"
  version "0.2.0"
  sha256 "40e9b3f04e7a02c5ab69dae8c21d024ac194757a2b77a9ee84e31f606f8fa4f8"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"ui-spy").write_env_script libexec/"bin/ui-spy",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/ui-spy --help")
    assert_includes output, "Usage: ui-spy"
  end
end
