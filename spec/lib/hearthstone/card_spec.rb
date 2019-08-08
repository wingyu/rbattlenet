require 'spec_helper'

describe RBattlenet::Hearthstone::Card do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_US')
  end

  describe '#find_cards' do
    it 'fetches list of cards' do
      args = {
        set: 'rise-of-shadows',
        class: 'mage',
        mana_cost: 10,
        attack: 4,
        health: 10,
        collectible: 1,        
        rarity: 'legendary',
        type: 'minion',
        minion_type: 'dragon',
        keyword: 'battlecry',
        text_filter: 'kalecgos',
        page: 1,
        page_size: 5,
        sort: 'name',
        order: 'desc'
      }

      VCR.use_cassette('hearthstone_cardlist_data') do
        cards = RBattlenet::Hearthstone::Card.find_cards(args)

        expect(cards['cardCount']).to eq 1
        expect(cards['cards'].first['name']).to eq 'Kalecgos'
      end
    end
  end

  describe '#find_card' do
    it 'fetches a card' do
      VCR.use_cassette('hearthstone_card_data') do
        card = RBattlenet::Hearthstone::Card.find_card(id_or_slug: '52119-arch-villain-rafaam')
          
        expect(card['name']).to eq 'Arch-Villain Rafaam'
      end
    end
  end
end
