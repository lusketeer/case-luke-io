class AddPictureToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :picture_url, :string
  end
end
