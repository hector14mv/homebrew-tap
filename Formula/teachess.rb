class Teachess < Formula
  include Language::Python::Virtualenv

  desc "Chess coach for your chess.com games, in the terminal and for agents"
  homepage "https://github.com/hector14mv/teachess"
  url "https://github.com/hector14mv/teachess/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0567a302cf30a60a1ca33d5d2a047c5bb921b224687729fdae80527b3c3723d6"
  license "MIT"

  depends_on "python@3.12"
  depends_on "stockfish"

  resource "chess" do
    url "https://files.pythonhosted.org/packages/93/09/7d04d7581ae3bb8b598017941781bceb7959dd1b13e3ebf7b6a2cd843bc9/chess-1.11.2.tar.gz"
    sha256 "a8b43e5678fdb3000695bdaa573117ad683761e5ca38e591c4826eba6d25bb39"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Para empezar, ejecuta:
        teachess
      Te pide tu usuario de chess.com y cuánto historial analizar.
    EOS
  end

  test do
    assert_match "chess.com", shell_output("#{bin}/teachess --help")
  end
end
