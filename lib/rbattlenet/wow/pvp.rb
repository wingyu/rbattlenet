module RBattlenet
  module Wow
    class Pvp
      def self.find_bracket(bracket)
        bracket = parse_bracket(bracket)
        uri = RBattlenet.base_uri("#{GAME}/leaderboard/#{bracket}?")

        RBattlenet.get(uri)
      end

      private
      def self.parse_bracket(bracket)
        if valid_bracket?(bracket)
          bracket
        else
          raise "Only 2v2, 3v3, 5v5 and rbg can be accepted as inputs"
        end
      end

      def self.valid_bracket?(bracket)
        ["2v2", "3v3", "5v5", "rbg"].include?(bracket)
      end
    end
  end
end
