class AddHotels < SeedMigration::Migration
  def up
  	Hotel.create!({
        :name => "Holiday Inn Miami International",
        :email => "Walter@himiaia.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Miami Airport Sheraton",
        :email => "Jnieto@sheratonmiamiairport.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Miami Airport Marriott",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Miami Airport Courtyard",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Miami Airport Residence Inn",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "DoubleTree by Hilton Miami Airport Convention Center",
        :email => "jvasquez@doubletreemacc.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Hyatt Place Miami Airport West / Doral",
        :email => "jannina.leon@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Intercontinental Hotel west Doral",
        :email => "edric.ruiz@r-hr.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Hyatt Regency Miami",
        :email => "Alvaro.rodriguez@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Marriott Dadeland",
        :email => "cidelia.louis@mdmusa.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.create!({
        :name => "Bonaventure Resort",
        :email => "rramirez@bonaventurefl.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
  end

  def down
  	Hotel.destroy_all({
        :name => "Holiday Inn Miami International",
        :email => "Walter@himiaia.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Miami Airport Sheraton",
        :email => "Jnieto@sheratonmiamiairport.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Miami Airport Marriott",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Miami Airport Courtyard",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Miami Airport Residence Inn",
        :email => "Shalaka.Mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "DoubleTree by Hilton Miami Airport Convention Center",
        :email => "jvasquez@doubletreemacc.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Hyatt Place Miami Airport West / Doral",
        :email => "jannina.leon@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Intercontinental Hotel west Doral",
        :email => "edric.ruiz@r-hr.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Hyatt Regency Miami",
        :email => "Alvaro.rodriguez@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Marriott Dadeland",
        :email => "cidelia.louis@mdmusa.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
    Hotel.destroy_all({
        :name => "Bonaventure Resort",
        :email => "rramirez@bonaventurefl.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "1234"
    })
  end
end
