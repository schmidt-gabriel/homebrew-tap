class Flowt < Formula
  desc "A terminal workflow automation engine"
  homepage "https://github.com/schmidt-gabriel/flowt"
  version "0.1.0-beta.1"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_SHA256"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AARCH64_SHA256"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"
    end
  end

  def install
    bin.install "flowt"
  end

  test do
    system "#{bin}/flowt", "--version"
  end
end
