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
require_relative "./s2/profile.rb"
require_relative "./s2/data_resources.rb"


module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  #Set API Key for requests. Required
  def self.authenticate(api_key)
    @@api_key = api_key

    @@options = "?locale=#{@@locale}&apikey=#{@@api_key}"
  end

  #Set region and locale for requests.
  #This defaults to the US region and en_US locale
  def self.set_region(region, locale)
    @@region = region
    @@locale = locale
    @@options = "?locale=#{@@locale}&apikey=#{@@api_key}"
  end

  module Wow; GAME = "wow" end
  module D3; GAME = "d3" end
  module S2; GAME = "s2" end


  private

  class << self

    #Wrapper for HTTParty requests that injects query parameters
    def get(uri, options = @@options)
      HTTParty.get(uri + options)
    end
    
    #Sets base uri for requests
    def base_uri(path)
      "https://#{@@region}.api.battle.net/#{path}"
    end

    def parse_spaces(input)
      input.gsub(" ", '%20')
    end

    #Mergers required and optional query parameters
    def merge_options(options)
      @@options + "#{options}"
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

