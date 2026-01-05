# typed: false
# frozen_string_literal: true

# Homebrew formula for CAS - Coding Agent System
# Install with: brew install codingagentsystem/tap/cas
#
# To create a tap repository:
# 1. Create repo: github.com/codingagentsystem/homebrew-tap
# 2. Add this file as Formula/cas.rb
# 3. Users can then: brew tap codingagentsystem/tap && brew install cas

class Cas < Formula
  desc "Coding Agent System - unified tasks, memory, rules, and skills for AI agents"
  homepage "https://github.com/codingagentsystem/cas"
  version "0.2.0"
  license :cannot_represent # Proprietary

  on_macos do
    on_arm do
      url "https://github.com/codingagentsystem/cas/releases/download/v#{version}/cas-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_MACOS_ARM64"
    end
    on_intel do
      odie "CAS does not support Intel macOS. Please use an Apple Silicon Mac."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/codingagentsystem/cas/releases/download/v#{version}/cas-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX_X86_64"
    end
    on_arm do
      odie "CAS does not support ARM64 Linux."
    end
  end

  def install
    bin.install "cas"
  end

  def caveats
    <<~EOS
      CAS has been installed!

      To get started:
        cas --help

      CAS stores data in:
        ~/.cas/           (global data)
        .cas/             (project data)

      To update CAS:
        cas update        (self-update)
        brew upgrade cas  (via Homebrew)
    EOS
  end

  test do
    assert_match "cas", shell_output("#{bin}/cas --version")
  end
end
