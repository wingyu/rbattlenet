require 'spec_helper'

describe RBattlenet::D3::Account do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_account" do
    it "fetches account data" do
      with_connection("d3_account") do
        result = RBattlenet::D3::Account.find("FaYe-2543")
        expect(result.paragonLevel).to be >= 1740
      end
    end
  end
end
