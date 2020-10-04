require 'spec_helper'

describe RBattlenet::Wow::PlayableClass::PvpTalentSlot, type: :game_data do

  describe "#find_pvp_talent_slots" do
    it "fetches playable class data" do
      with_connection("wow_pvp_talent_slots") do
        result = RBattlenet::Wow::PlayableClass::PvpTalentSlot.find(1)
        expect(result.talent_slots.first.unlock_player_level).to eq 20
      end
    end
  end
end
