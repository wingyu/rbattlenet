require_relative "../lib/rbattlenet.rb"
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :typhoeus
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.color = true

  if ENV["REAL_CONNECTIONS"] || ENV["RECORD_CASSETTE"]
    config.before(:all, type: :game_data) do
      RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    end

    config.before(:all, type: :community) do
      RBattlenet.authenticate(client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"])
    end
  else
    RBattlenet.fake_authenticate
  end
end

def with_connection(cassette)
  if ENV["REAL_CONNECTIONS"]
    yield
  else
    VCR.use_cassette(cassette) do
      yield
    end
  end
end
