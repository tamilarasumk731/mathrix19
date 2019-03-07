class UserMailer < ApplicationMailer
	default from: "contact@mathrix.in"

	def registration(user)
	    @user = user
	    @qr = RQRCode::QRCode.new(self.mathrix_id).to_img.resize(200, 200).to_data_url
	    mail(to: @user.email, subject: "Registration Successful for Mathrix'19")
  	end

  	def resend(user)
	    @user = user
	    @qr = RQRCode::QRCode.new(@user.mathrix_id).to_img.resize(200, 200).to_data_url
	    mail(to: @user.email, subject: "Resend Registration Successful for Mathrix'19")
  	end
end
