class Newsletter < ActiveRecord::Base
	def self.email_exist?(email)
		find_by(email: email)
	end
end
