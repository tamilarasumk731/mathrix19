class UserMailer < ApplicationMailer
	default from: "contact@mathrix.in"

	def registration(user, m_id)
	    @user = user
	    @qr = RQRCode::QRCode.new(m_id).to_img.resize(200, 200).to_data_url
	    mail(to: @user.email, subject: "Registration Successful for Mathrix'19")
  	end

  	def resend(user, m_id)
	    @user = user
	    @qr = RQRCode::QRCode.new(m_id).to_img.resize(200, 200).to_data_url
	    mail(to: @user.email, subject: "Resending Registration Successful for Mathrix'19")
  	end
end
