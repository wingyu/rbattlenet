require 'spec_helper'

describe RBattlenet::D3::Recipe, type: :community do

  describe "#find_recipe" do
    it "fetches recipe data" do
      with_connection("d3_recipe") do
        result = RBattlenet::D3::Recipe.find(artisan: "blacksmith", id: "apprentice-flamberge")
        expect(result.name).to eq "Apprentice Flamberge"
      end
    end
  end

  describe "#find_multiple_recipes" do
    it "fetches recipe data" do
      with_connection("d3_recipe_multiple") do
        collection = RBattlenet::D3::Recipe.find([
          { artisan: "blacksmith", id: "apprentice-flamberge" },
          { artisan: "jeweler", id: "flawless-amethyst" }
        ])

        expect(collection.results.map(&:name).sort).to eq ["Apprentice Flamberge", "Flawless Amethyst"]
      end
    end
  end
end
