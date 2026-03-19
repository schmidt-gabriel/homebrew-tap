class Rdu < Formula
  desc "A terminal disk usage analyzer written in Rust"
  homepage "https://github.com/schmidt-gabriel/rdu"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8dce84e02dbc5b71452f8fa31e63e33085475523c58e2e7723b766b662766519"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e1e152d9d4fa3db68ffb394c23ee9f5c0493b518802151f1841aa114d61b0b63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a40a566bbe06097f7fc3d6c937e03a6b42ff9542fc95295fb201a148aaa86ce"
    end

    on_intel do
      url "https://github.com/schmidt-gabriel/rdu/releases/download/v#{version}/rdu-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eaf87356390bf942da2ff16fc927bd61714c6bb217ca6c7186807fdc50f9afb3"
    end
  end

  def install
    bin.install "rdu"
  end

  test do
    system "#{bin}/rdu", "--version"
  end
end
