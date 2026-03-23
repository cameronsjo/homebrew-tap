# typed: false
# frozen_string_literal: true

class Envctl < Formula
  desc "Safely CRUD environment variables in .env files without exposing sensitive values"
  homepage "https://github.com/cameronsjo/envctl"
  url "https://github.com/cameronsjo/envctl/archive/refs/tags/envctl-v0.1.1.tar.gz"
  sha256 "b59e00f33be883c77f90849a5abd589a74bc3076668607fe453c9b48000f4fa9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Verify the binary runs
    assert_match "envctl", shell_output("#{bin}/envctl --version")

    # Test basic CRUD
    ENV["HOME"] = testpath
    (testpath/".env").write("FOO=bar\n")
    assert_equal "bar", shell_output("#{bin}/envctl get FOO").strip
    system bin/"envctl", "set", "NEW_KEY", "new_value"
    assert_equal "new_value", shell_output("#{bin}/envctl get NEW_KEY").strip
    system bin/"envctl", "delete", "FOO"
    assert_equal "NEW_KEY", shell_output("#{bin}/envctl list").strip
  end
end
