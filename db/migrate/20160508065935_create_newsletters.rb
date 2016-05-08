class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email
      t.integer :status, default: 1, limit: 1

      t.timestamps null: false
    end
  end
end
