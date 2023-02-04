require 'spec_helper'

describe RBattlenet::Wow::Title do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_title" do
    it "fetches title data" do
      with_connection("wow_title") do
        result = RBattlenet::Wow::Title.find(6)
        expect(result.name).to eq "Knight"
      end
    end
  end

  describe "#find_multiple_titles" do
    it "fetches title data" do
      with_connection("wow_title_multiple") do
        collection = RBattlenet::Wow::Title.find([6, 7])
        expect(collection.map(&:name).sort).to eq ["Knight", "Knight-Lieutenant"]
      end
    end
  end

  describe "#find_all_titles" do
    it "fetches all title data" do
      with_connection("wow_title_all") do
        result = RBattlenet::Wow::Title.all
        expect(result.titles.size).to be >= 368
      end
    end
  end

  describe "#as_hash" do
    describe "#find_all_titles" do
      it "fetches all title data" do
        with_connection("wow_title_all") do
          RBattlenet.set_options(response_type: :hash)
          result = RBattlenet::Wow::Title.all
          expect(result[:titles].size).to be >= 368
        end
      end
    end
  end
end
