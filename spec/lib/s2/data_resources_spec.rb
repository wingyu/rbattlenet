#require 'spec_helper'

#describe RBattlenet::S2::DataResources do
  #before do
    #RBattlenet.authenticate(ENV["API"])
    #RBattlenet.set_region("eu", "en_GB")
  #end

  #describe "#find_item" do
    #it "fetches item data" do
      #VCR.use_cassette('s2_item_data') do
        #data = "CrABCL-oudQGEgcIBBWZWjYNHWU61OAdyg3pEx07J28kHevi5AUd8dNq1TCLAjj_AkAAUBJYBGD_AmorCgwIABDX3bKmiICA4DESGwi5u5abChIHCAQVIpaumDCPAjgAQAFYBJABAGorCgwIABCl3rKmiICA4DESGwiR9M-gAhIHCAQVIpaumDCLAjgAQAFYBJABAIABRqUBOydvJK0Bj5DKULUBAXBvArgB9aCdsg7AAQEYsuqy0wFQAFgC"
        #item = RBattlenet::D3::DataResources.
          #find_item(data)

        #expect(item['name']).to eq "The Cloak of the Garwulf"
      #end
    #end
  #end

  #describe "#find_follower" do
    #it "fetches follower data" do
      #VCR.use_cassette('s2_follower_data') do
        #follower = RBattlenet::D3::DataResources.
          #find_follower('templar')

        #expect(follower['name']).to eq "Templar"
      #end
    #end
  #end

  #describe "#find_artisan" do
    #it "fetches artisan data" do
      #VCR.use_cassette('s2_artisan_data') do
        #artisan = RBattlenet::D3::DataResources.
          #find_artisan('blacksmith')
          
        #expect(artisan['name']).to eq "Blacksmith"
      #end
    #end
  #end
#end
