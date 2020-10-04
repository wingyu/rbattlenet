require 'spec_helper'

describe RBattlenet::Wow::MythicKeystoneAffix, type: :game_data do

  describe "#find_mythic_keystone_affix" do
    it "fetches keystone affix data" do
      with_connection("wow_mythic_keystone_affix") do
        result = RBattlenet::Wow::MythicKeystoneAffix.find(6)
        expect(result.name).to eq "Raging"
      end
    end
  end

  describe "#find_multiple_mythic_keystone_affixes" do
    it "fetches keystone affix data" do
      with_connection("wow_mythic_keystone_affix_multiple") do
        collection = RBattlenet::Wow::MythicKeystoneAffix.find([6, 7])
        expect(collection.results.map(&:name).sort).to eq ["Bolstering", "Raging"]
      end
    end
  end

  describe "#find_all_mythic_keystone_affixes" do
    it "fetches all keystone affix data" do
      with_connection("wow_mythic_keystone_affix_all") do
        result = RBattlenet::Wow::MythicKeystoneAffix.all
        expect(result.affixes.size).to be >= 18
      end
    end
  end
end
