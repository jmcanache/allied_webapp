class ChangeFieldstoint < ActiveRecord::Migration
  def change
  	change_column :bookings, :single, :integer
  	change_column :bookings, :double, :integer
  end
end
