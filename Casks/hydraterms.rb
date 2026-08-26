cask "hydraterms" do
  version "0.2.14"
  sha256 "5153c3c8ae4a3db1138f2dc41317197c8d3faf7c5c951c1d4d5f194fc5a82426"

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
