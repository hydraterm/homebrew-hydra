cask "hydraterms" do
  version "0.2.7"
  sha256 "ab454b70a5ae7b5057c4c9db8b9f2a1f807b98e52c31381b6af280335de96780"

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
