class User < ApplicationRecord
	before_save :generate_mid
	# after_save :generate_qrcode
	after_commit :registration_success_mail
	def generate_mid
		self.mathrix_id = "M19" + rand(1001..9999).to_s
	end

	# def generate_qrcode
	# 	@qr = RQRCode::QRCode.new( self.mathrix_id, size: 4)
	# end

	def registration_success_mail
		@qr = RQRCode::QRCode.new( self.mathrix_id, size: 4)
		UserMailer.registration(self, @qr).deliver
	end
end
