class Flowt < Formula
  desc "A terminal workflow automation engine"
  homepage "https://github.com/schmidt-gabriel/flowt"
  version "0.1.0-beta"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "928c42fad1bf7963d8b1df58753aa5edff267675bb0776e4319798c7b2cae397"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3f11d2149e26c5f8a58d5f1b9060c01be7658c18ea0b41c8854ffa595c35c1b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a51cdf5f7ec87a988416d07e52b7b69c848b6b33bdf19397bfd56a7656db415e"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/flowt/releases/download/v#{version}/flowt-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d58e49f7e678cd04459b528438680935cdf5ea0f5d686230bd439cf7ba8f36ff"
    end
  end

  def install
    bin.install "flowt"
  end

  test do
    system "#{bin}/flowt", "--version"
  end
end
