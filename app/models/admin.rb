class Admin < ActiveRecord::Base
	def self.valid_admin(data)
		find_by(name:data[:email], password:data[:password])
	end

	def self.valid_admin_pass(user, data)
		find_by(name:user, password:data[:old_password])
	end
end
