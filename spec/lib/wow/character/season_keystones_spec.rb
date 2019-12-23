require 'spec_helper'

describe RBattlenet::Wow::Character::SeasonKeystones do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_season_keystones" do
    it "fetches character data" do
      with_connection("wow_character_season_keystones") do
        result = RBattlenet::Wow::Character::SeasonKeystones.find(realm: "stormrage", name: "sheday", season: 3)
        expect(result.best_runs.class).to eq Array
      end
    end
  end
end
