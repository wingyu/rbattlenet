require 'typhoeus'
require 'json'

require "rbattlenet/exceptions"
require "rbattlenet/version"
require "rbattlenet/result_collection"
require "rbattlenet/endpoints/base"

#World of Warcraft API
require_relative "./endpoints/wow/character.rb"
require_relative "./endpoints/wow/item.rb"

#Diablo 3 API
# require_relative "./endpoints/d3/profile.rb"
# require_relative "./endpoints/d3/data_resources.rb"

# #Starcraft 2 API
# require_relative "./endpoints/sc2/profile.rb"
# require_relative "./endpoints/sc2/ladder.rb"
# require_relative "./endpoints/sc2/data_resources.rb"

# #Hearthstone API
# require_relative "./endpoints/hearthstone/card.rb"
# require_relative "./endpoints/hearthstone/deck.rb"
# require_relative "./endpoints/hearthstone/metadata.rb"

module RBattlenet
  @@region = "eu"
  @@locale = "en_gb"
  @@raw = false

  module Wow; GAME = "wow" end
  module D3; GAME = "d3" end
  module Sc2; GAME = "sc2" end
  module Hearthstone; GAME = "hearthstone" end

  class << self
    #Set Access Token for requests. Required
    def authenticate(client_id:, client_secret:)
      response = Typhoeus.post("https://#{@@region}.battle.net/oauth/token",
        body: { grant_type: :client_credentials },
        userpwd: "#{client_id}:#{client_secret}",
      )
      raise RBattlenet::Errors::Unauthorized.new if response.code == 401
      @@token = JSON.parse(response.body)['access_token']
      true
    end

    def set_options(region: @@region, locale: @@locale, raw_response: @@raw)
      @@region, @@locale, @@raw = locale, namespace, raw_response
      true
    end

    def get(requests)
      store = @@raw ? [] : RBattlenet::ResultCollection.new

      headers = {}
      headers['Authorization'] = "Bearer #{@@token}" if @@token

      # Limit concurrency to prevent hitting the API request per-second cap.
      hydra = Typhoeus::Hydra.new(max_concurrency: 50)
      requests.each do |uri, source_object|
        request = Typhoeus::Request.new(uri, headers: headers)

        request.on_complete do |response|
          yield source_object, response if block_given?
          store << response
        end

        hydra.queue request
      end

      hydra.run
      store.size == 1 ? store.first : store
    rescue => err
      raise RBattlenet::Errors::ConnectionError.new
    end

    def uri(path, query = nil)
      "https://#{@@region}.api.blizzard.com/#{path}?namespace=static-#{@@region}&locale=#{@@locale}&#{query}"
    end
  end
end
