class User < ApplicationRecord
	# belongs_to :college
	has_many :workshops
	has_many :userevents, dependent: :destroy
	has_many :events, through: :userevents
	validates_uniqueness_of :email, presence: true
	validates_uniqueness_of :mathrix_id, presence: true

	before_save :generate_mid
	after_save :registration_success_mail
	def generate_mid
		self.mathrix_id = "M19" + rand(1001..9999).to_s
	end

	def registration_success_mail
		# @qr = RQRCode::QRCode.new(self.mathrix_id).to_img.resize(200, 200).to_data_url
		UserMailer.registration(self, self.mathrix_id).deliver_now
	end

	def self.resend_mail
		@user = self.first
		# @qr = RQRCode::QRCode.new(@user.mathrix_id).to_img.resize(200, 200).to_data_url
		UserMailer.resend(@user, @user.mathrix_id).deliver_now
	end
end
