require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)
RBattlenet.set_region("eu", "en_gb")


response = RBattlenet::Wow::Character.search("madfrogz", "outland", "achievements")
puts response
