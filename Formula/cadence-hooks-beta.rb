# typed: false
# frozen_string_literal: true

class CadenceHooksBeta < Formula
  desc "Cadence hooks (beta channel) — prerelease builds for testing"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.5.0-beta.2"
  license "BSL-1.1"

  conflicts_with "cadence-hooks", because: "both install a `cadence-hooks` binary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "39f3e3a733b92f7e91822849598c7ef7ec0b87898f9b0a37a556e344163a7e1e"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "b5d4f7542429644390ad4623f7c89463f944abb731171be01b63d48601b4c33e"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "de66d7f7075c4aa9051b997b57cfa55ef28e0b274fbdde715094b2c83e9c1e28"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "7062d2bfc61a057538b2aa3b77c097489ece176aabf263b9458f5f1ea2bc45ba"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
