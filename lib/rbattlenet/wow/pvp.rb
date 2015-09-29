module RBattlenet
  module Wow
    class Pvp
      def self.find_bracket(bracket:)
        bracket = parse_bracket(bracket)
        uri = RBattlenet.base_uri("#{GAME}/leaderboard/#{bracket}?")

        RBattlenet.get(uri)
      end

      private
      def self.parse_bracket(bracket)
        if valid_bracket?(bracket)
          bracket
        else
          raise RBattlenet::Errors::InvalidInput
        end
      end

      def self.valid_bracket?(bracket)
        ["2v2", "3v3", "5v5", "rbg"].include?(bracket)
      end
    end
  end
end
