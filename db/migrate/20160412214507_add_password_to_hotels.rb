class AddPasswordToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :password, :string
  end
end
