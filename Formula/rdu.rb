class Rdu < Formula
  desc "A terminal disk usage analyzer written in Rust"
  homepage "https://github.com/schmidt-gabriel/rdu"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9ea1c7eae237a248074dc760dec59f7d1cb61b61e142b8d6f9add79848326fc7"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6c2e84e25714f25bfa3d7b9857861fdf54949df2b0562b85928286f6f68e4dec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2794c6179ea12c1c421a361dfdc07bc84be37ecadf2227ae882abed6cd85531b"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47b24639d81791a87935673f226b5e447a580fa408d68206ded91198edcbf784"
    end
  end

  def install
    bin.install "rdu"
  end

  test do
    system "#{bin}/rdu", "--version"
  end
end
