require 'spec_helper'

describe RBattlenet::Wow::Guild do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#search" do
    it "fetches guild profile data" do
      VCR.use_cassette('guild_profile') do
        guild = RBattlenet::Wow::Guild.
          search("razors edge", "saurfang")

        expect(guild['name']).to eq "Razors Edge"
      end
    end

    it "fetches optional field data" do
      VCR.use_cassette('guild_fields') do
        guild = RBattlenet::Wow::Guild.
          search("razors edge", "saurfang", "members")

        expect(guild['members'].count).to eq 331
      end
    end
  end
end
