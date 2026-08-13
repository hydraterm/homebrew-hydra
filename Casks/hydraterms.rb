cask "hydraterms" do
  version "0.2.9"
  sha256 "5cd6a08e3b545d38099e06a8caf8a92e547ade6759b32e187d34888335901fc6"

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
