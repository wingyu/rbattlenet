require 'spec_helper'

describe RBattlenet::Wow::Token do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_token" do
    it "fetches token data" do
      with_connection("wow_token") do
        result = RBattlenet::Wow::Token.all
        expect(result.last_updated_timestamp).to be >= 1577024131000
      end
    end
  end
end
