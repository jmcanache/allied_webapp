class ChangeDefultValueSingleDouble < ActiveRecord::Migration
  def change
  	change_column :bookings, :single, :string, default: "0"
  	change_column :bookings, :double, :string, default: "0"
  end
end
