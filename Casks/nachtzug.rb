# Nachtzug, make electronic music without knowing any music theory: https://nachtzugmusic.com/
#   brew install mjohanning99/nachtzug/nachtzug
cask "nachtzug" do
  version "0.3.5"
  sha256 "a09c5a6312ef5a72f3f208f98c6b0cf91e4377df999f01a1a6c0fe3b404e9874"

  url "https://github.com/mjohanning99/nachtzug/releases/download/v#{version}/Nachtzug-macOS.dmg"
  name "Nachtzug"
  desc "Make electronic music, such as acid or Berlin School, without music theory"
  homepage "https://nachtzugmusic.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Nachtzug.app"

  # only on "brew uninstall --zap": the settings, the spare copies of songs and the sounds saved in Nachtzug
  zap trash: [
    "~/Library/Application Support/Nachtzug",
    "~/Library/Preferences/com.nachtzug.Nachtzug.plist",
    "~/Library/Saved Application State/io.github.mjohanning99.nachtzug.savedState",
  ]

  caveats <<~EOS
    Nachtzug isn’t signed by a registered Apple developer, so the first time, macOS says it can’t
    check Nachtzug for malware: click Done, open System Settings → Privacy & Security, scroll down
    and click Open Anyway.
  EOS
end
