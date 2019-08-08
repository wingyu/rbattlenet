require 'spec_helper'

describe RBattlenet::Hearthstone::Deck do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_US')
  end

  describe '#find_deck' do
    it 'fetches a deck' do
      VCR.use_cassette('hearthstone_deck_data') do
        deck = RBattlenet::Hearthstone::Deck.find_deck(deckcode: 'AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA')

        expect(deck['cardCount']).to eq 30
      end
    end
  end
end
