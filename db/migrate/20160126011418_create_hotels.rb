class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :email
      t.string :single
      t.string :double

      t.timestamps null: false
    end
  end
end
