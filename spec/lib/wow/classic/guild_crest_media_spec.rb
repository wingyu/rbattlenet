require 'spec_helper'

describe RBattlenet::Wow::Classic::GuildCrestMedia, type: :game_data do

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
