class ChangeColumnTypeInHotels < ActiveRecord::Migration
  def change
  	change_column :hotels, :single, :integer
  	change_column :hotels, :double, :integer
  end
end
