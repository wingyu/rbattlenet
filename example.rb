require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)
RBattlenet.set_region("us", "en_us")


response = RBattlenet::Wow::Battlepet.search_stats(258, 25, 5, 4)
puts response
