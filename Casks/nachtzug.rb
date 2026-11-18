# Nachtzug, make electronic music without knowing any music theory: https://nachtzugmusic.com/
#   brew install mjohanning99/nachtzug/nachtzug
cask "nachtzug" do
  version "0.4.1"
  sha256 "45f4829976ae080b4fd0d46d57bcfa04869dd89a3284547e9d91995209311b6a"

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
