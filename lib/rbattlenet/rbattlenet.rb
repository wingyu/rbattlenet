require "rbattlenet/version"
require "typhoeus"

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

#Error-handling
require_relative "./errors/invalid_input.rb"
require_relative "./errors/error.rb"

module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  #Set API Key for requests. Required
  def self.authenticate(api_key:)
    @@api_key = api_key

    @@queries = "?locale=#{@@locale}&apikey=#{@@api_key}"
    return true
  end

  #Set region and locale for requests.
  #This defaults to the US region and en_US locale
  def self.set_region(region:, locale:)
    @@region, @@locale = region, locale
    @@queries = "?locale=#{@@locale}&apikey=#{@@api_key}"
    return true
  end

  module Wow; GAME = "wow" end
  module D3; GAME = "d3" end
  module Sc2; GAME = "sc2" end


  private

  class << self

    #Wrapper for Typhoeus requests that injects query parameters
    def get(uri, queries = @@queries)
      Typhoeus.get(URI.escape(uri + queries))
    end

    #Custom wrapper using Typheous parallel requests for wowaudit
    def get_multiple(characters)
      hydra = Typhoeus::Hydra.new
      characters.each do |uri, character|
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
      "https://#{@@region}.api.battle.net/#{path}"
    end

    #Merges required and optional query parameters
    def merge_queries(queries)
      @@queries + "#{queries}"
    end

    #Parses two-worded fields into the correct format
    #and join up multiple fields
    def parse_fields(fields)
      unless fields.nil?
        fields.map! do |field|
          field.gsub(/\s\S/,&:upcase).gsub(/\s/, "")
        end
        "&fields=" + fields.join("+")
      end
    end
  end
end
