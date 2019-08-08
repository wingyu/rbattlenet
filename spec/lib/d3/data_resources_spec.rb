require 'spec_helper'

describe RBattlenet::D3::DataResources do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    RBattlenet.set_region(region: "eu", locale: "en_GB")
  end

  describe "#find_item" do
    it "fetches item data" do
      VCR.use_cassette('d3_item_data', :record => :all) do
        data = "corrupted-ashbringer-Unique_Sword_2H_104_x1"
        item = RBattlenet::D3::DataResources.find_item(data: data)

        expect(item['name']).to eq "Corrupted Ashbringer"
      end
    end
  end

  describe "#find_follower" do
    it "fetches follower data" do
      VCR.use_cassette('d3_follower_data') do
        follower = RBattlenet::D3::DataResources.
          find_follower(follower: 'templar')

        expect(follower['name']).to eq "Templar"
      end
    end
  end

  describe "#find_artisan" do
    it "fetches artisan data" do
      VCR.use_cassette('d3_artisan_data') do
        artisan = RBattlenet::D3::DataResources.
          find_artisan(artisan: 'blacksmith')
          
        expect(artisan['name']).to eq "Blacksmith"
      end
    end
  end
end
