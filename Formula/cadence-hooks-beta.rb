# typed: false
# frozen_string_literal: true

class CadenceHooksBeta < Formula
  desc "Cadence hooks (beta channel) — prerelease builds for testing"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.11.0-beta.4"
  license "BSL-1.1"

  conflicts_with "cadence-hooks", because: "both install a `cadence-hooks` binary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "d2015dc92391d407a881199f7fbf63a5d50f5458c5ffa57ee3ab0c88fda8c0f0"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "1a9f4c7d20fabe2e422153e972e02fc6f34bda80cd16ebf7a75ba9d0b24bb3d7"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "52fad7b58111bbd9551d52d335a8781b18254e243d8710e8c6dedb4d8b758ad2"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "2b76b8cf034a97d73ac9d83626614eecdfe8e38fdb6c65ae47e4c61285d6391c"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
