cask "hydraterms" do
  version "0.2.13"
  sha256 "5d253af7c7f0e3a62d1b20db4097297466672e5a4d9b07f3b41b5fd8bbe5b9e9"

  url "https://hydraterms.com/downloads/releases/#{version}/Hydra-macOS.dmg"
  name "Hydra"
  desc "Native terminal workspace with end-to-end encrypted browser access"
  homepage "https://hydraterms.com/"

  livecheck do
    url "https://hydraterms.com/downloads/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :big_sur

  app "Hydra.app"

  caveats <<~EOS
    Hydra asks you to approve protected-folder access only when your workflow needs it.
    macOS requires that approval in System Settings; Homebrew cannot grant it for the app.
  EOS
end
