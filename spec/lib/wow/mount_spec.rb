require 'spec_helper'

describe RBattlenet::Wow::Mount, type: :game_data do

  describe "#find_mount" do
    it "fetches mount data" do
      with_connection("wow_mount") do
        result = RBattlenet::Wow::Mount.find(6)
        expect(result.name).to eq "Brown Horse"
      end
    end
  end

  describe "#find_multiple_mounts" do
    it "fetches mount data" do
      with_connection("wow_mount_multiple") do
        collection = RBattlenet::Wow::Mount.find([6, 7])
        expect(collection.results.map(&:name).sort).to eq ["Brown Horse", "Gray Wolf"]
      end
    end
  end

  describe "#find_all_mounts" do
    it "fetches all mount data" do
      with_connection("wow_mount_all") do
        result = RBattlenet::Wow::Mount.all
        expect(result.mounts.size).to be >= 778
      end
    end
  end
end
