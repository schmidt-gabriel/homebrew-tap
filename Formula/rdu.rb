class Rdu < Formula
  desc "A terminal disk usage analyzer written in Rust"
  homepage "https://github.com/schmidt-gabriel/rdu"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ea8a428efe9ac2088cde2a69128299ca4f6be5159e97b957268c561601d86824"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3fb72991660ec3a90fc59b361d4b226c3e5e681801adff4731f1bab97198aede"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d744ed549e01dd6bd0123aded4094970146900df0a6299108ec04dcad7dbcde"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9affae2f64b2591cef2caa1b659db811c378f2196dba3399d2389c0149be1993"
    end
  end

  def install
    bin.install "rdu"
  end

  test do
    system "#{bin}/rdu", "--version"
  end
end
