class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :email
      t.integer :password

      t.timestamps null: false
    end
  end
end
