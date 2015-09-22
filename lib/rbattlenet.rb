require 'httparty'
require "rbattlenet/version"

require_relative "./rbattlenet/wow/character.rb"


module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  def self.authenticate(api_key)
    const_set("API_KEY", api_key)
  end

  def self.set_region(region, locale)
    @@region = region
    @@locale = locale
  end

  module Wow; GAME = "wow" end

  private

  def self.base_uri(path)
    "https://#{@@region}.api.battle.net/#{path}&locale=#{@@locale}&apikey=#{API_KEY}"
  end

  def self.parse_field(field)
    unless field.nil?
      field.gsub(/\s\S/,&:upcase).gsub(/\s/, "")
    end
  end
end

