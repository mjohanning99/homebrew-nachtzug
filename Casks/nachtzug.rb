# Nachtzug, a DAW made for beginners: https://mjohanning99.github.io/nachtzug/
#   brew install mjohanning99/nachtzug/nachtzug
cask "nachtzug" do
  version "0.3.4"
  sha256 "ccdf929cf438a8afd144ea1a7d953fc4ce4e15645384efa59396bc14b24359e9"

  url "https://github.com/mjohanning99/nachtzug/releases/download/v#{version}/Nachtzug-macOS.dmg"
  name "Nachtzug"
  desc "DAW made for beginners"
  homepage "https://mjohanning99.github.io/nachtzug/"

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
