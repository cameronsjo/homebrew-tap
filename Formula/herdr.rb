# typed: false
# frozen_string_literal: true

# Fork build of herdr carrying the command palette from herdrdev/herdr#2299,
# which the upstream contribution gate closes automatically as an over-budget
# feature.
#
# Prebuilt rather than built from source on purpose: libghostty-vt pins Zig
# 0.15.2, whose bundled libSystem is older than the macOS 26 SDK, so a native
# build fails to link (herdrdev/herdr#285). The release binaries are produced on
# GitHub runners with Homebrew's zig@0.15.
class Herdr < Formula
  desc "Terminal agent runtime, with a command palette (fork build)"
  homepage "https://github.com/cameronsjo/herdr"
  version "0.8.0-palette1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cameronsjo/herdr/releases/download/v0.8.0-palette1/herdr-macos-aarch64"
      sha256 "904e0ebb4a8496729264c84ac90656716944782c6f48b8d92852e1b98e40201f"
    end

    on_intel do
      url "https://github.com/cameronsjo/herdr/releases/download/v0.8.0-palette1/herdr-macos-x86_64"
      sha256 "b5102850a41c6cdb8ed36a6380fbf6e31f6be9530043b31c99bae3e227f7d85d"
    end
  end

  def install
    binary = Dir["herdr-macos-*"].first
    odie "no herdr binary in the download" if binary.nil?
    bin.install binary => "herdr"
  end

  def caveats
    <<~EOS
      This replaces the homebrew-core herdr. To go back to upstream stable:

        brew uninstall cameronsjo/tap/herdr
        brew install herdr

      The palette opens with `prefix+/`. In a remote session the server owns the
      keybinding, so the remote machine needs this build too.
    EOS
  end

  test do
    assert_match "herdr", shell_output("#{bin}/herdr --version")
  end
end
