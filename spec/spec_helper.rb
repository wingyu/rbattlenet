require_relative "../lib/rbattlenet.rb"
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :typhoeus
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.color = true
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
