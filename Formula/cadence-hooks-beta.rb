# typed: false
# frozen_string_literal: true

class CadenceHooksBeta < Formula
  desc "Cadence hooks (beta channel) — prerelease builds for testing"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.9.0-beta.5"
  license "BSL-1.1"

  conflicts_with "cadence-hooks", because: "both install a `cadence-hooks` binary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "e30efd9fbf62d5ea0e71be7f8bcdc262ff3a6a84bab80be2f016c480b6d18bec"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "cf8248b42587b04720221f8d7ec6957affdcb8c4d6b06add24af980214e2def6"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "0fd9ab80c0c96d001446a8e2615481ef21cbed1a5ddbe05d03ca60c8174470e9"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "00c77c0c28f740d1bd41b65330c22470a4b5135a0ee93c95a9378a4797afb40c"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
