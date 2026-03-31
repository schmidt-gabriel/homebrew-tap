class Rdu < Formula
  desc "A terminal disk usage analyzer written in Rust"
  homepage "https://github.com/schmidt-gabriel/rdu"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0e76af36f0358864e15b419d587a58e89d94411ad53df0cc6da4d65029b6f226"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1db08f92d85c4927f4c1f437e9c544951b1cbd450288f4836fef27360ad450a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd6e53892e12856913c2a1548ab210ca81e2672ed670bbc0c39a87176d7049e2"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76ea0108148607383b2b0f5898cfa968f410a01f51430e50c0231b17a9099fbf"
    end
  end

  def install
    bin.install "rdu"
  end

  test do
    system "#{bin}/rdu", "--version"
  end
end
