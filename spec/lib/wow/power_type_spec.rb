require 'spec_helper'

describe RBattlenet::Wow::PowerType, type: :game_data do

  describe "#find_power_type" do
    it "fetches power type data" do
      with_connection("wow_power_type") do
        result = RBattlenet::Wow::PowerType.find(1)
        expect(result.name).to eq "Rage"
      end
    end
  end

  describe "#find_multiple_power_types" do
    it "fetches power type data" do
      with_connection("wow_power_type_multiple") do
        collection = RBattlenet::Wow::PowerType.find([1, 2])
        expect(collection.results.map(&:name).sort).to eq ["Focus", "Rage"]
      end
    end
  end

  describe "#find_all_power_types" do
    it "fetches all power type data" do
      with_connection("wow_power_type_all") do
        result = RBattlenet::Wow::PowerType.all
        expect(result.power_types.size).to be >= 6
      end
    end
  end
end
