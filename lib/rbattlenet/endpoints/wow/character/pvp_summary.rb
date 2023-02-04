module RBattlenet
  module Wow
    class Character::PvpSummary < RBattlenet::Endpoints::Base
      EAGER_CHILDREN = true

      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/pvp-summary?namespace=profile-")
      end

      def self.get_children(headers, store, parent_response)
        result = Oj.load(parent_response.body, symbol_keys: true) rescue nil
        shuffle_brackets = (result&.dig(:brackets) || []).map { |br| br[:href] if br[:href].include?('shuffle') }.compact

        shuffle_brackets.each do |bracket_uri|
          bracket_request = Typhoeus::Request.new(Addressable::URI.parse(bracket_uri).normalize.to_s, headers: headers)
          bracket_response = bracket_request.run
          store.add(bracket_uri.split('pvp-bracket/').last.split('?').first, bracket_response)
        end

        shuffle_brackets.size
      end
    end
  end
end
