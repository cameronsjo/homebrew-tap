# typed: false
# frozen_string_literal: true

class CadenceHooksBeta < Formula
  desc "Cadence hooks (beta channel) — prerelease builds for testing"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.4.1-beta.7"
  license "BSL-1.1"

  conflicts_with "cadence-hooks", because: "both install a `cadence-hooks` binary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "ceebf053b0de2558568124a497d2bb5b7ff1067cad2d260fb9daf1696c996837"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "026b99ad4b93825919845a86051558e1047b2ca8dd6239c79b4a561450a2a765"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "2a5bbd6c43f91b09740f29e87f73cfab6060f0402c37f14727a2c9c98f20ff01"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "70c998601e63c3526a713a30aa75437283e334abc96555a3186d1811e97e762e"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
