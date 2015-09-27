require 'spec_helper'

describe RBattlenet::Wow::Guild do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find" do
    it "fetches guild profile data" do
      VCR.use_cassette('wow_guild_profile') do
        guild = RBattlenet::Wow::Guild.
          find("razors edge", "saurfang")

        expect(guild['name']).to eq "Razors Edge"
      end
    end

    it "fetches optional field data" do
      VCR.use_cassette('wow_guild_fields') do
        guild = RBattlenet::Wow::Guild.
          find("razors edge", "saurfang", ["members"])

        expect(guild['members'][0]['character']['name']).to eq "Tornak"
      end
    end
  end
end
