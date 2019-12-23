require 'spec_helper'

describe RBattlenet::Wow::Classic::GuildCrestMedia do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_all_guild_crest_media" do
    it "fetches all guild crest media" do
      with_connection("wow_classic_guild_crest_media_all") do
        result = RBattlenet::Wow::Classic::GuildCrestMedia.all
        expect(result.emblems.size).to be >= 196
        expect(result.borders.size).to be >= 6
      end
    end
  end
end
