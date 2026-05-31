# typed: false
# frozen_string_literal: true

class CadenceHooksBeta < Formula
  desc "Cadence hooks (beta channel) — prerelease builds for testing"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.11.0-beta.2"
  license "BSL-1.1"

  conflicts_with "cadence-hooks", because: "both install a `cadence-hooks` binary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "d8c1de8820593ede4a770f7b63dd1eb6c695600dc5436ea6aefc4cd6d1e68d46"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "fad7ec25581e003f867b8b4560e01d70672ebc309802daf80b85dc6540d1b690"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "40596fe7cf4710c48470ce69a217a91f59c1be5db589091138901ea342585b40"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "2eaa2c269c91c1d9c38f8b1d4afdae21aa634e710080adc98bdac65ec1705032"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
