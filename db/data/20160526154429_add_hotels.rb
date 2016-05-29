class AddHotels < SeedMigration::Migration
  def up
  	Hotel.create!({
        :name => "Holiday Inn Miami International",
        :email => "walter@himiaia.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "rtge56"
    })
    Hotel.create!({
        :name => "Miami Airport Sheraton",
        :email => "jnieto@sheratonmiamiairport.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "hytui12"
    })
    Hotel.create!({
        :name => "Miami Airport Marriott",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "grfh87"
    })
    Hotel.create!({
        :name => "Miami Airport Courtyard",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "yty56"
    })
    Hotel.create!({
        :name => "Miami Airport Residence Inn",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "nhty23"
    })
    Hotel.create!({
        :name => "DoubleTree by Hilton Miami Airport Convention Center",
        :email => "jvasquez@doubletreemacc.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "plok89"
    })
    Hotel.create!({
        :name => "Hyatt Place Miami Airport West / Doral",
        :email => "jannina.leon@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "tyru78"
    })
    Hotel.create!({
        :name => "Intercontinental Hotel west Doral",
        :email => "edric.ruiz@r-hr.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "yhtr32"
    })
    Hotel.create!({
        :name => "Hyatt Regency Miami",
        :email => "alvaro.rodriguez@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "fgte45"
    })
    Hotel.create!({
        :name => "Marriott Dadeland",
        :email => "cidelia.louis@mdmusa.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "jmnhy64"
    })
    Hotel.create!({
        :name => "Bonaventure Resort",
        :email => "rramirez@bonaventurefl.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "sdfre67"
    })
  end

  def down
  	Hotel.create!({
        :name => "Holiday Inn Miami International",
        :email => "walter@himiaia.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "rtge56"
    })
    Hotel.create!({
        :name => "Miami Airport Sheraton",
        :email => "jnieto@sheratonmiamiairport.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "hytui12"
    })
    Hotel.create!({
        :name => "Miami Airport Marriott",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "grfh87"
    })
    Hotel.create!({
        :name => "Miami Airport Courtyard",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "yty56"
    })
    Hotel.create!({
        :name => "Miami Airport Residence Inn",
        :email => "shalaka.mcfarlane@marriott.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "nhty23"
    })
    Hotel.create!({
        :name => "DoubleTree by Hilton Miami Airport Convention Center",
        :email => "jvasquez@doubletreemacc.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "plok89"
    })
    Hotel.create!({
        :name => "Hyatt Place Miami Airport West / Doral",
        :email => "jannina.leon@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "tyru78"
    })
    Hotel.create!({
        :name => "Intercontinental Hotel west Doral",
        :email => "edric.ruiz@r-hr.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "yhtr32"
    })
    Hotel.create!({
        :name => "Hyatt Regency Miami",
        :email => "alvaro.rodriguez@hyatt.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "fgte45"
    })
    Hotel.create!({
        :name => "Marriott Dadeland",
        :email => "cidelia.louis@mdmusa.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "jmnhy64"
    })
    Hotel.create!({
        :name => "Bonaventure Resort",
        :email => "rramirez@bonaventurefl.com",
        :single => "0",
        :double => "0",
        :created_at => "2015-11-26 15:37:23",
        :updated_at => "2015-11-26 15:37:23",
        :password => "sdfre67"
    })
  end
end
