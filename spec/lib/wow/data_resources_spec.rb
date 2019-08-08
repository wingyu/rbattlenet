require 'spec_helper'

describe RBattlenet::Wow::DataResources do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_us')
  end

  describe '#find_battlegroups' do
    it 'fetches battlegroups data' do
      VCR.use_cassette('wow_data_resources_battlegroup') do
        battlegroups = RBattlenet::Wow::DataResources.find_battlegroups
        expect(battlegroups['battlegroups'][0]['name']).to eq 'AU/NZ Battle Group'
      end
    end
  end

  describe '#find_character_races' do
    it 'fetches character_races data' do
      VCR.use_cassette('wow_data_resources_character_races') do
        character_races = RBattlenet::Wow::DataResources.find_character_races
        expect(character_races['races'][0]['name']).to eq 'Human'
      end
    end
  end

  describe '#find_character_classes' do
    it 'fetches character_classes data' do
      VCR.use_cassette('wow_data_resources_character_classes') do
        character_classes = RBattlenet::Wow::DataResources.find_character_classes
        expect(character_classes['classes'][0]['name']).to eq 'Warrior'
      end
    end
  end

  describe '#find_character_achievements' do
    it 'fetches character_achievements data' do
      VCR.use_cassette('wow_data_resources_character_achievements') do
        character_achievements = RBattlenet::Wow::DataResources.find_character_achievements
        expect(character_achievements['achievements']).not_to be_empty
      end
    end
  end

  describe '#find_guild_rewards' do
    it 'fetches guild_rewards data' do
      VCR.use_cassette('wow_data_resources_guild_rewards') do
        guild_rewards = RBattlenet::Wow::DataResources.find_guild_rewards
        expect(guild_rewards['rewards']).not_to be_empty
      end
    end
  end

  describe '#find_guild_perks' do
    it 'fetches guild_perks data' do
      VCR.use_cassette('wow_data_resources_guild_perks') do
        guild_perks = RBattlenet::Wow::DataResources.find_guild_perks
        expect(guild_perks['perks'][0]['spell']['name']).to eq 'Mount Up'
      end
    end
  end

  describe '#find_guild_achievements' do
    it 'fetches guild_achievements data' do
      VCR.use_cassette('wow_data_resources_guild_achievements') do
        guild_achievements = RBattlenet::Wow::DataResources.find_guild_achievements
        expect(guild_achievements['achievements'][0].count).to eq 3
      end
    end
  end

  describe '#find_item_classes' do
    it 'fetches item_classes data' do
      VCR.use_cassette('wow_data_resources_item_classes') do
        item_classes = RBattlenet::Wow::DataResources.find_item_classes
        expect(item_classes['classes'][0]['name']).to eq 'Consumable'
      end
    end
  end

  describe '#find_talents' do
    it 'fetches talents data' do
      VCR.use_cassette('wow_data_resources_talents') do
        talents = RBattlenet::Wow::DataResources.find_talents
        expect(talents['1']['class']).to eq 'warrior'
      end
    end
  end

  describe '#find_pet_types' do
    it 'fetches pet_types data' do
      VCR.use_cassette('wow_data_resources_pet_types') do
        pet_types = RBattlenet::Wow::DataResources.find_pet_types
        expect(pet_types['petTypes'][0]['name']).to eq 'Humanoid'
      end
    end
  end

  describe '#token' do
    it 'fetches token data' do
      VCR.use_cassette('wow_data_resources_token') do
        token = RBattlenet::Wow::DataResources.token
        expect(token['price']).not_to be_nil
      end
    end
  end
end
