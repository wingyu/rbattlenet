require 'spec_helper'

describe RBattlenet::Wow::Character::Media do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_character_media" do
    it "fetches character data" do
      with_connection("wow_character_media") do
        result = RBattlenet::Wow::Character::Media.find(realm: "stormrage", name: "sheday")
        expect(result.render_url.class).to eq String
      end
    end
  end
end
