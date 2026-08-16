cask "hydraterms" do
  version "0.2.12"
  sha256 "26fca141b4f28e25c81e1e5bea194ddbe2b780e1a3897284618f23c4aa4f57a5"

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
