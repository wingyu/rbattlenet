require_relative "../lib/rbattlenet.rb"
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :typhoeus
end

RSpec.configure do |config|
  config.color = true
end
