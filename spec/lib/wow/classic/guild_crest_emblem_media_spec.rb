require 'spec_helper'

describe RBattlenet::Wow::Classic::GuildCrestEmblemMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_guild_crest_emblem_media" do
    it "fetches guild crest emblem media data" do
      with_connection("wow_classic_guild_crest_emblem_media") do
        result = RBattlenet::Wow::Classic::GuildCrestEmblemMedia.find(1)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_guild_crest_emblem_media" do
    it "fetches guild crest emblem media data" do
      with_connection("wow_classic_guild_crest_emblem_media_multiple") do
        collection = RBattlenet::Wow::Classic::GuildCrestEmblemMedia.find([1, 2])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["image", "image"]
      end
    end
  end
end
