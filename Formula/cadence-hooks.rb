# typed: false
# frozen_string_literal: true

class CadenceHooks < Formula
  desc "Compiled enforcement hooks for cadence, git-guardrails, rules, and obsidian plugins"
  homepage "https://github.com/cameronsjo/cadence-hooks"
  version "0.100.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-x86_64.tar.gz"
      sha256 "a59382d1c5d69a8857c0abc5cdb268aaf7713d335f7b989211ec67f30c0fb5f9"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-macos-aarch64.tar.gz"
      sha256 "2ee8611df853af266bcc00c32a4efef058ed782297a18194b66b72dd20a69439"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-x86_64.tar.gz"
      sha256 "8330cce4d66535b75f2a77dfdc195ddf44ac9ec6bd487427fd46a0de6166f095"

      def install
        bin.install "cadence-hooks"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/cameronsjo/cadence-hooks/releases/download/v#{version}/cadence-hooks-v#{version}-linux-aarch64.tar.gz"
      sha256 "4b1d65b913767072e050eb55c45e6ae58c67435cc23c6701bffc092b709df586"

      def install
        bin.install "cadence-hooks"
      end
    end
  end

  test do
    system "#{bin}/cadence-hooks", "--help"
  end
end
