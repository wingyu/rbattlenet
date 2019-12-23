require 'spec_helper'

describe RBattlenet::Wow::GuildCrestBorderMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_guild_crest_border_media" do
    it "fetches guild crest border media data" do
      with_connection("wow_guild_crest_border_media") do
        result = RBattlenet::Wow::GuildCrestBorderMedia.find(1)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_guild_crest_border_media" do
    it "fetches guild crest border media data" do
      with_connection("wow_guild_crest_border_media_multiple") do
        collection = RBattlenet::Wow::GuildCrestBorderMedia.find([1, 2])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["image", "image"]
      end
    end
  end
end
