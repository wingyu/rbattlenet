require 'spec_helper'

describe RBattlenet::D3::Artisan do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_artisan" do
    it "fetches artisan data" do
      with_connection("d3_artisan") do
        result = RBattlenet::D3::Artisan.find(1)
        expect(result.name).to eq "Jeweler"
      end
    end
  end

  describe "#find_multiple_artisans" do
    it "fetches artisan data" do
      with_connection("d3_artisan_multiple") do
        collection = RBattlenet::D3::Artisan.find([1, 2])
        expect(collection.map(&:name).sort).to eq ["Jeweler", "Mystic"]
      end
    end
  end
end
