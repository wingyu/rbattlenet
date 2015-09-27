require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)

response = RBattlenet::Wow::Guild.find("razors edge", "saurfang", ["members"])
p response
