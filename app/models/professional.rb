require 'open-uri'

class Professional < ActiveRecord::Base
  before_save :get_geo_from_address
  
  def get_geo_from_address
    api_header = "https://maps.googleapis.com/maps/api/geocode/json?address="
    lookup_query = (api_header + address).gsub(/ /, "+")
    response = open(lookup_query).read
    location = JSON.parse(response)["results"].first["geometry"]["location"]
    self.lat = location["lat"].to_s
    self.lng = location["lng"].to_s
  end
end
