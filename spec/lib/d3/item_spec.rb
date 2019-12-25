require 'spec_helper'

describe RBattlenet::D3::Item do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_item" do
    it "fetches item data" do
      with_connection("d3_item") do
        result = RBattlenet::D3::Item.find("corrupted-ashbringer-Unique_Sword_2H_104_x1")
        expect(result.name).to eq "Corrupted Ashbringer"
      end
    end
  end
end
