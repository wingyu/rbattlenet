require 'httparty'
require "rbattlenet/version"

require_relative "./rbattlenet/wow/character.rb"
require_relative "./rbattlenet/wow/achievement.rb"
require_relative "./rbattlenet/wow/auction.rb"
require_relative "./rbattlenet/wow/battlepet.rb"
require_relative "./rbattlenet/wow/challenge.rb"
require_relative "./rbattlenet/wow/item.rb"
require_relative "./rbattlenet/wow/guild.rb"


module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  def self.authenticate(api_key)
    const_set("API_KEY", api_key)
    @@options = { query: {locale: @@locale, apikey: API_KEY} }
  end

  def self.set_region(region, locale)
    @@region = region
    @@locale = locale
  end

  module Wow; GAME = "wow" end

  private

  class << self
    def get(uri, options = @@options)
      HTTParty.get(uri, options)
    end

    def base_uri(path)
      "https://#{@@region}.api.battle.net/#{path}"
    end

    def parse_spaces(input)
      input.gsub(" ", '%20')
    end

    def merge_options(options)
      query_fields = options.inject(&:merge)

      {query: @@options[:query].merge(query_fields)}
    end

    def parse_field(field)
      unless field.nil?
        field.gsub(/\s\S/,&:upcase).gsub(/\s/, "")
      end
    end
  end
end

