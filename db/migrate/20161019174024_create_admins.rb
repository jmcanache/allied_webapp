class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :password
      t.integer :active

      t.timestamps null: false
    end
  end
end
