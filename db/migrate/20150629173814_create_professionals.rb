class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :specialty

      t.timestamps null: false
    end
  end
end
