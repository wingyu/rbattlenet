require_relative "./lib/rbattlenet.rb"

key =  ENV["API"]

RBattlenet.authenticate(key)

response = RBattlenet::Wow::DataResources.find_pet_types
p response
