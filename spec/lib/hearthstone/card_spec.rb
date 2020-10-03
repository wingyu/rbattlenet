require 'spec_helper'

describe RBattlenet::Hearthstone::Card, type: :game_data do

  describe "#find_single_card" do
    it "fetches card data" do
      with_connection("hearthstone_single_card") do
        result = RBattlenet::Hearthstone::Card.find("52119-arch-villain-rafaam")
        expect(result.name).to eq "Arch-Villain Rafaam"
      end
    end
  end

  describe "#find_multiple_single_cards" do
    it "fetches card data" do
      with_connection("hearthstone_single_card_multiple") do
        collection = RBattlenet::Hearthstone::Card.find([
          { slug: "52119-arch-villain-rafaam" },
          "53002-kalecgos",
        ])
        expect(collection.results.map(&:name).sort).to eq ["Arch-Villain Rafaam", "Kalecgos"]
      end
    end
  end

  describe "#find_cards" do
    it "fetches card data" do
      with_connection("hearthstone_cards") do
        result = RBattlenet::Hearthstone::Card.find(manaCost: 1, attack: 1, health: 1)
        expect(result.cards.size).to be >= 40
      end
    end
  end

  describe "#find_multiple_cards" do
    it "fetches card data" do
      with_connection("hearthstone_cards_multiple") do
        collection = RBattlenet::Hearthstone::Card.find([
          { manaCost: 1, attack: 1, health: 1 },
          { manaCost: 3, attack: 5, health: 1 },
        ])
        expect(collection.results.map(&:cards).map(&:size).sort).to eq [4, 40]
      end
    end
  end
end
