class AddGeoToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :lat, :string
    add_column :professionals, :lng, :string
  end
end
