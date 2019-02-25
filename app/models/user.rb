class User < ApplicationRecord
	belongs_to :college
	validates_uniqueness_of :mobile, presence: true
	validates_uniqueness_of :email, presence: true
	validates_uniqueness_of :mathrix_id, presence: true

	before_save :generate_mid
	# after_save :generate_qrcode
	after_commit :registration_success_mail
	def generate_mid
		self.mathrix_id = "M19" + rand(1001..9999).to_s
	end

	def registration_success_mail
		@qr = RQRCode::QRCode.new( self.mathrix_id, size: 4)
		UserMailer.registration(self, @qr).deliver_now!
	end

	def self.resend_mail(user)
		@qr = RQRCode::QRCode.new( user.mathrix_id, size: 4)
		UserMailer.resend(user, @qr).deliver_now!
	end
end
