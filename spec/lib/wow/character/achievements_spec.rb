require 'spec_helper'

describe RBattlenet::Wow::Character::Achievements do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_achievements" do
    it "fetches character data" do
      with_connection("wow_character_achievements") do
        result = RBattlenet::Wow::Character::Achievements.find(realm: "stormrage", name: "sheday")
        expect(result.achievements.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_achievementss" do
    it "fetches character data" do
      with_connection("wow_character_achievements_multiple") do
        collection = RBattlenet::Wow::Character::Achievements.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:achievements).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
