class AddHotelData < SeedMigration::Migration
  	def up
	  	Hotel.create!({
	        :name => "Sherry Frontenac Hotel",
	        :email => "mjcanache@gmail.com",
	        :single => "10",
	        :double => "10",
	        :created_at => "2015-11-26 15:37:23",
	        :updated_at => "2015-11-26 15:37:23"
	    })

	    Hotel.create!({
	        :name => "JW Marriot",
	        :email => "mjcanache@gmail.com",
	        :single => "10",
	        :double => "10",
	        :created_at => "2015-11-26 15:37:23",
	        :updated_at => "2015-11-26 15:37:23"
	    })
  	end

  	def down
	  	Hotel.destroy_all({
	        :name => "Sherry Frontenac Hotel",
	        :email => "mjcanache@gmail.com",
	        :single => "10",
	        :double => "10",
	        :created_at => "2015-11-26 15:37:23",
	        :updated_at => "2015-11-26 15:37:23"
	    })

	    Hotel.destroy_all({
	        :name => "JW Marriot",
	        :email => "mjcanache@gmail.com",
	        :single => "10",
	        :double => "10",
	        :created_at => "2015-11-26 15:37:23",
	        :updated_at => "2015-11-26 15:37:23"
	    })
  	end
end