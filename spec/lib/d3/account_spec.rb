require 'spec_helper'

describe RBattlenet::D3::Account, type: :community do

  describe "#find_account" do
    it "fetches account data" do
      with_connection("d3_account") do
        result = RBattlenet::D3::Account.find("FaYe-2543")
        expect(result.paragonLevel).to be >= 1740
      end
    end
  end
end
