class UserMailer < ApplicationMailer
	default from: "contact@mathrix.in"

	def registration(user, m_id)
	    @user = user
	    @qr = @qr = RQRCode::QRCode.new( m_id, size: 4)
	    mail(to: @user.email, subject: "Registration Successful for Mathrix'19")
  	end

  	def resend(user, m_id)
	    @user = user
	    @qr = @qr = RQRCode::QRCode.new( m_id, size: 4)
	    mail(to: @user.email, subject: "Resending Registration Successful for Mathrix'19")
  	end
end
