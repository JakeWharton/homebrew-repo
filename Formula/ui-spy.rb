class UiSpy < Formula
  desc "Monitor products on the Ubiquiti Store and receive notifications when their availability changes."
  homepage "https://github.com/JakeWharton/ui-spy"
  url "https://github.com/JakeWharton/ui-spy/releases/download/0.1.0/ui-spy.zip"
  version "0.1.0"
  sha256 "f6a1b959c8e10696149bfca8416d63425654d78374cd97f2352c336146195635"

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
