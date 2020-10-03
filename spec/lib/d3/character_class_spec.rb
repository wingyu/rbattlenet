require 'spec_helper'

describe RBattlenet::D3::CharacterClass, type: :community do

  describe "#find_character_class" do
    it "fetches character_class data" do
      with_connection("d3_character_class") do
        result = RBattlenet::D3::CharacterClass.find(1)
        expect(result.name).to eq "Barbarian"
      end
    end
  end

  describe "#find_multiple_character_classs" do
    it "fetches character_class data" do
      with_connection("d3_character_class_multiple") do
        collection = RBattlenet::D3::CharacterClass.find([1, 2])
        expect(collection.results.map(&:name).sort).to eq ["Barbarian", "Wizard"]
      end
    end
  end
end
