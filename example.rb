require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)

response = RBattlenet::Wow::Realm.find
p response
