require 'spec_helper'

describe RBattlenet::Wow::Character::Legacy do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_legacy_characters" do
    it "fetches legacy character data" do
      with_connection("wow_legacy_characters") do
        result = RBattlenet::Wow::Character::Legacy.find(
          realm: "stormrage",
          name: "sheday",
        )
        expect(result.name).to eq "Sheday"
      end
    end
  end

  describe "#find_multiple_legacy_characterss" do
    it "fetches legacy character data" do
      with_connection("wow_legacy_characters_multiple") do
        collection = RBattlenet::Wow::Character::Legacy.find([
          {
            realm: "stormrage",
            name: "sheday",
          },
          {
            realm: "stormrage",
            name: "marks",
          }
        ])
        expect(collection.map(&:name).sort).to eq ["Marks", "Sheday"]
      end
    end
  end
end
