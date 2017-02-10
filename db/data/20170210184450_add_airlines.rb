class AddAirlines < SeedMigration::Migration
  def up
  	airlines = ['None',
			    'Aerolineas Argentinas', 
			    'Aeromexico',
			    'Air Berlin',
			    'Air France',
			    'Alitalia',
			    'American Airlines',
			    'American Eagle',
			    'Avianca',
			    'Bahamas Air',
			    'British Airways',
			    'Copa Airlines',
			    'Gol Airlines',
			    'Iberia',
			    'Interjet',
			    'Lan Argentina',
			    'Lan Chile',
			    'Lan Colombia',
			    'Lan Ecuador',
			    'Lan Peru',
			    'Luthansa',
			    'Qatar Airways',
			    'Santa Barbara Airlines',
			    'Swiss Air',
			    'Taca',
			    'Tam Brazilian Airlines',
			    'Tap Air Portugal',
			    'Transaero',
			    'United Airlines',
			    'Virgin Atlantic']

	airlines.each do |f|
		Airline.create!({
        :name => f
    })
	end
  end

  def down
  	airlines = ['None',
			    'Aerolineas Argentinas', 
			    'Aeromexico',
			    'Air Berlin',
			    'Air France',
			    'Alitalia',
			    'American Airlines',
			    'American Eagle',
			    'Avianca',
			    'Bahamas Air',
			    'British Airways',
			    'Copa Airlines',
			    'Gol Airlines',
			    'Iberia',
			    'Interjet',
			    'Lan Argentina',
			    'Lan Chile',
			    'Lan Colombia',
			    'Lan Ecuador',
			    'Lan Peru',
			    'Luthansa',
			    'Qatar Airways',
			    'Santa Barbara Airlines',
			    'Swiss Air',
			    'Taca',
			    'Tam Brazilian Airlines',
			    'Tap Air Portugal',
			    'Transaero',
			    'United Airlines',
			    'Virgin Atlantic']
			    
  	Airline.destroy_all({
        :name => f,
    })
  end
end
