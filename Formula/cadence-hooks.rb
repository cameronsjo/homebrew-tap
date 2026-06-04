# typed: false
# frozen_string_literal: true

class CadenceHooks < Formula
  desc "Compiled enforcement hooks for cadence, git-guardrails, rules, and obsidian plugins"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.19.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "7201064cbe28078eb14989d0ed75ece4b14b1ab2ed56a62cc44c58c514845a62"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "516bf0c35ce9486ef2005aa8d65cf0462106013c25ff2f132c3fbf95296b8cdf"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "2725795b4bf369c675d92b4e5a5f79b1996357a3c7fc9c43c7926f3eae6f25f8"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "9899290cd10128af22e59a6310c26f94aeb74774afd509910cc68be1b019854b"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
