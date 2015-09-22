require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)
RBattlenet.set_region("us", "en_us")


response = RBattlenet::Wow::Character.search("milhause", "saurfang", "pet slots")

puts response



