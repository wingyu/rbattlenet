require 'spec_helper'

describe RBattlenet::Hearthstone::Deck do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_deck" do
    it "fetches deck data" do
      with_connection("hearthstone_deck") do
        result = RBattlenet::Hearthstone::Deck.find(
          "AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA"
        )
        expect(result.hero.id).to eq 7
      end
    end
  end

  describe "#find_multiple_decks" do
    it "fetches deck data" do
      with_connection("hearthstone_deck_multiple") do
        collection = RBattlenet::Hearthstone::Deck.find([
          "AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA",
          "AAECAf0EHk27AskDqwTFBMsElgXyBYoH7Ae+7ALG+AKggAOfmwOgmwOKngOhoQP8owOLpAOSpAPypQOEpwP1rAP6rAPsrwPwrwOBsQORsQPhtgOftwMAAA"
        ])
        expect(collection.map(&:hero).map(&:id).sort).to eq [7, 637]
      end
    end
  end
end
