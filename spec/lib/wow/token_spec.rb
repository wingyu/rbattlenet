require 'spec_helper'

describe RBattlenet::Wow::Token, type: :game_data do

  describe "#find_token" do
    it "fetches token data" do
      with_connection("wow_token") do
        result = RBattlenet::Wow::Token.all
        expect(result.price).to_not be nil
      end
    end
  end
end
