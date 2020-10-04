require 'spec_helper'

describe RBattlenet::Wow::Class::Media do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_media" do
    it "fetches class media data" do
      with_connection("wow_class media") do
        result = RBattlenet::Wow::Class::Media.find(8)
        expect(result.assets.first.key).to eq "icon"
      end
    end
  end
end
