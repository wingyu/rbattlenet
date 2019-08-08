require 'httparty'
require "rbattlenet/version"

#World of Warcraft API
require_relative "./wow/character.rb"
require_relative "./wow/achievement.rb"
require_relative "./wow/auction.rb"
require_relative "./wow/battlepet.rb"
require_relative "./wow/challenge.rb"
require_relative "./wow/item.rb"
require_relative "./wow/guild.rb"
require_relative "./wow/pvp.rb"
require_relative "./wow/quest.rb"
require_relative "./wow/realm.rb"
require_relative "./wow/recipe.rb"
require_relative "./wow/spell.rb"
require_relative "./wow/data_resources.rb"

#Diablo 3 API
require_relative "./d3/profile.rb"
require_relative "./d3/data_resources.rb"

#Starcraft 2 API
require_relative "./sc2/profile.rb"
require_relative "./sc2/ladder.rb"
require_relative "./sc2/data_resources.rb"

#Hearthstone API
require_relative "./hearthstone/card.rb"
require_relative "./hearthstone/deck.rb"
require_relative "./hearthstone/metadata.rb"

#Error-handling
require_relative "./errors/invalid_input.rb"
require_relative "./errors/error.rb"

module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  #Set Access Token for requests. Required
  def self.authenticate(client_id:, client_secret:)
    response = HTTParty.post("https://us.battle.net/oauth/token",
      basic_auth: {
        username: client_id,
        password: client_secret,
      },
      body: {
        grant_type: :client_credentials
      }
    )
    @@token = response['access_token']
    return true
  end

  #Set region and locale for requests.
  #This defaults to the US region and en_US locale
  def self.set_region(region:, locale:)
    @@region, @@locale = region, locale
    return true
  end

  def self.region
    @@region
  end

  module Wow; GAME = "wow" end
  module D3; GAME = "d3" end
  module Sc2; GAME = "sc2" end
  module Hearthstone; GAME = "hearthstone" end


  private

  class << self

    #Wrapper for HTTParty requests that injects query parameters
    def get(uri, queries = nil)

      begin
        headers = {}
        headers['Authorization'] = "Bearer #{@@token}" if @@token

        uri = "#{uri}?locale=#{@@locale}"
        uri = "#{uri}&#{queries}" unless queries.nil?
        # Was having trouble with vcr, so switched to Typhoeus to be consistent with get_multiple
        # HTTParty.get(URI.encode(uri), headers: headers)
        uri = URI.encode(uri)

        request = Typhoeus::Request.new(uri, headers: headers)

        hydra = Typhoeus::Hydra.new
        hydra.queue(request)
        hydra.run
        response = request.response

        JSON.parse(response.body)
      rescue
        RBattlenet::Errors::ConnectionError
      end
    end

    #Custom wrapper using Typheous parallel requests for wowaudit
    def get_multiple(characters)
      hydra = Typhoeus::Hydra.new
      requests = characters.each do |uri, character|
        request = Typhoeus::Request.new(uri)
        request.on_complete do |response|
          character.process_result(response)
        end
        hydra.queue(request)
      end
      hydra.run
      characters
    end

    #Sets base uri for requests
    def base_uri(path)
      "https://#{@@region}.api.blizzard.com/#{path}"
    end

    #Parses two-worded fields into the correct format
    #and join up multiple fields
    def parse_fields(fields)
      unless fields.nil?
        fields.map! do |field|
          field.gsub(/\s\S/,&:upcase).gsub(/\s/, "")
        end
        "fields=" + fields.join("+")
      end
    end
  end
end
