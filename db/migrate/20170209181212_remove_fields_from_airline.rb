class RemoveFieldsFromAirline < ActiveRecord::Migration
  def change
    remove_column :airlines, :email, :string
    remove_column :airlines, :password, :string
  end
end
