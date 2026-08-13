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
#
# Apple Silicon only as of 0.8.0-palette.2 — every consumer of this tap runs
# arm64 macOS, so the fork builds that target alone. (The x86_64 build also
# fails, on undefined ghostty_* symbols from zig's x86_64 output, but the
# reason not to ship it is that nobody needs it.)
class Herdr < Formula
  desc "Terminal agent runtime, with a command palette (fork build)"
  homepage "https://github.com/cameronsjo/herdr"
  version "0.8.0-palette.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      # v#{version}, not a literal — the update-formula automation rewrites
      # `version` and the sha256 but never the url, so a hardcoded version here
      # would leave every automated bump pointing at the previous release.
      url "https://github.com/cameronsjo/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "1c5b674e3358d1370c2ff17345cefbdbaf3384d5cfe767363e3aa1fbc657b442"
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
