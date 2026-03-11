# typed: false
# frozen_string_literal: true

class ClaudeHooks < Formula
  desc "Compiled Claude Code hooks for cadence, git-guardrails, rules, and obsidian plugins"
  homepage "https://github.com/cameronsjo/claude-hooks"
  version "0.1.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "9ed39c0afa109e571a8493c128aa6a964585404d26fbbdf01f385135be63fd6a"

      def install
        bin.install "claude-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "0c0fe1615119a5d6861c705bfee0da8451c4592ce3a65861354f3e59cb2b5c88"

      def install
        bin.install "claude-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "abbd395d5d3b5044af53ba1425f2160a5917b90e93c37178cd3bdfc0eacb0b32"

      def install
        bin.install "claude-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "744e330071d8b83801514850c44c500b4981caa847d837db0f07d03eef436df7"

      def install
        bin.install "claude-hooks"
      end
    end
  end

  test do
    system "#{bin}/claude-hooks", "--help"
  end
end
