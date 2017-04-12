class CreateCreditcards < ActiveRecord::Migration
  def change
    create_table :creditcards do |t|
      t.string :card_number
      t.string :name
      t.integer :zip_code
      t.integer :verification_code
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
