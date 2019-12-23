require 'spec_helper'

describe RBattlenet::Wow::Character::Equipment do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_equipment" do
    it "fetches character data" do
      with_connection("wow_character_equipment") do
        result = RBattlenet::Wow::Character::Equipment.find(realm: "stormrage", name: "sheday")
        expect(result.equipped_items.class).to eq Array
      end
    end
  end

  describe "#find_multiple_character_equipments" do
    it "fetches character data" do
      with_connection("wow_character_equipment_multiple") do
        collection = RBattlenet::Wow::Character::Equipment.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.results.map(&:equipped_items).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
