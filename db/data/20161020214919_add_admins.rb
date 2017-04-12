class AddAdmins < SeedMigration::Migration
  def up
  	Admin.create!({
        :name => "m.rolo@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
    Admin.create!({
        :name => "j.santiago@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
    Admin.create!({
        :name => "admin@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
  end

  def down
  	Admin.destroy_all({
        :name => "m.rolo@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
    Admin.destroy_all({
        :name => "j.santiago@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
    Admin.destroy_all({
        :name => "admin@allied-hospitality.com",
        :active => "1",
        :password => "1234",
        :created_at => "2016-10-20 15:37:23",
        :updated_at => "2016-10-20 15:37:23"
    })
  end
end
