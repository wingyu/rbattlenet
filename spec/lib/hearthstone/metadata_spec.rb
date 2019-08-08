require 'spec_helper'

describe RBattlenet::Hearthstone::Metadata do
  before do
    RBattlenet.authenticate(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'])
    RBattlenet.set_region(region: 'us', locale: 'en_US')
  end

  describe '#find_all_metadata' do
    it 'fetches all metadata' do
      VCR.use_cassette('hearthstone_metadata_data') do
        data = RBattlenet::Hearthstone::Metadata.all_metadata

        expect(data.keys).to include("sets")
      end
    end
  end

  describe '#find_metadata' do
    it 'finds metadata by type' do
      VCR.use_cassette('hearthstone_metadata_type_data') do
        metadata = RBattlenet::Hearthstone::Metadata.find_metadata(type: 'sets')
        set_data = metadata.detect{|k,v| k["id"] == 1158}

        expect(set_data['name']).to eq 'Saviors of Uldum'
      end
    end
  end
end
