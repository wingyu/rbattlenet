require 'spec_helper'

describe RBattlenet::Wow::Character do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character" do
    it "fetches character data" do
      with_connection("wow_character") do
        result = RBattlenet::Wow::Character.find(realm: "stormrage", name: "sheday")
        expect(result.name).to eq "Sheday"
      end
    end
  end

  describe "#find_non_existing_character" do
    it "returns an empty result" do
      with_connection("wow_character_empty") do
        result = RBattlenet::Wow::Character.find(realm: "stormrage", name: "whowouldeverusethisforacharactername")
        expect(result.data).to eq nil
      end
    end
  end

  describe "#find_multiple_characters" do
    it "fetches character data" do
      with_connection("wow_character_multiple") do
        collection = RBattlenet::Wow::Character.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ])
        expect(collection.map(&:name).sort).to eq ["Sheday", "Альвеоняша"]
      end
    end
  end

  describe "#find_character_with_multiple_fields" do
    it "fetches character data" do
      with_connection("wow_character_fields") do
        result = RBattlenet::Wow::Character.find(realm: "stormrage", name: "sheday", fields: [:keystones, :achievements])
        expect(result.name).to eq "Sheday"
        expect(result.keystones.current_period.best_runs.class).to eq Array
        expect(result.achievements.class).to eq Array
      end
    end
  end

  describe "#find_multiple_characters_with_multiple_fields" do
    it "fetches character data" do
      with_connection("wow_character_multiple_fields") do
        collection = RBattlenet::Wow::Character.find([
          { realm: "stormrage", name: "sheday" },
          { realm: "howling-fjord", name: "альвеоняша" },
        ], fields: [:keystones, :achievements])
        expect(collection.map(&:name).sort).to eq ["Sheday", "Альвеоняша"]
        expect(collection.map(&:achievements).map(&:class)).to eq [Array, Array]
      end
    end
  end
end
