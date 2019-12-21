require 'spec_helper'

describe RBattlenet::D3::Skill do
  before do
    RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
  end

  describe "#find_skill" do
    it "fetches skill data" do
      with_connection("d3_skill") do
        result = RBattlenet::D3::Skill.find(class_slug: "barbarian", id: "bash")
        expect(result.skill.name).to eq "Bash"
      end
    end
  end

  describe "#find_multiple_skills" do
    it "fetches skill data" do
      with_connection("d3_skill_multiple") do
        collection = RBattlenet::D3::Skill.find([
          { class_slug: "barbarian", id: "bash" },
          { class_slug: "necromancer", id: "bone-spear" }
        ])
        expect(collection.results.map(&:skill).map(&:name).sort).to eq ["Bash", "Bone Spear"]
      end
    end
  end
end
