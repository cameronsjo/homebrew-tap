# typed: false
# frozen_string_literal: true

class ClaudeHooks < Formula
  desc "Compiled Claude Code hooks for cadence, git-guardrails, rules, and obsidian plugins"
  homepage "https://github.com/cameronsjo/claude-hooks"
  version "0.1.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"

      def install
        bin.install "claude-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"

      def install
        bin.install "claude-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"

      def install
        bin.install "claude-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/claude-hooks/releases/download/v#{version}/claude-hooks-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"

      def install
        bin.install "claude-hooks"
      end
    end
  end

  test do
    system "#{bin}/claude-hooks", "--help"
  end
end
