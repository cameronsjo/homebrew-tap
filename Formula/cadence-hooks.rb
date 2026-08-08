# typed: false
# frozen_string_literal: true

class CadenceHooks < Formula
  desc "Compiled enforcement hooks for cadence, git-guardrails, rules, and obsidian plugins"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.75.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "73a19e951a8092f5b8c0027eeb2712cc0879a2d5436ad44f7136889b034287e5"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "8a96ca887768c991463e7b731808dd402c14c1147057976358f3b9221ea96bf4"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "b275da7b05e28549f7805f9755f0894c8b36a7cad7f88127eb0627e6d2efe249"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "8a12a5e909cf5cdc491ad94c054b7af077f1c694f0e746b24d12b7f3c862909a"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
