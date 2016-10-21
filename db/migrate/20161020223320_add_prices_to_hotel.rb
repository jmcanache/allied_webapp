class AddPricesToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :price_single, :float, default: 0
    add_column :hotels, :price_double, :float, default: 0
  end
end
