require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)
RBattlenet.set_region("us", "en_us")


response = RBattlenet::Wow::Achievement.search("2144")

puts response



