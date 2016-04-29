class AddNewToHotels < SeedMigration::Migration
  def up
  	Hotel.create!({
	        :name => "Hampton Hotel",
	        :email => "mjcanache@gmail.com",
	        :single => "10",
	        :double => "10",
	        :created_at => "2015-11-26 15:37:23",
	        :updated_at => "2015-11-26 15:37:23",
	        :password => "1234"
	    })
  end

  def down

  end
end
