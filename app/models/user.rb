class User < ApplicationRecord
	before_save :generate_mid

	def generate_mid
		self.mathrix_id = "M19" + rand(1001..9999).to_s
	end
end
