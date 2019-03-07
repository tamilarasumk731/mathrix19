class UserMailer < ApplicationMailer
	default from: "contact@mathrix.in"

	def registration(user, qr)
	    @user = user
	    @qr = qr
	    mail(to: @user.email, subject: "Registration Successful for Mathrix'19")
  	end

  	def resend(user, qr)
	    @user = user
	    @qr = qr
	    mail(to: @user.email, subject: "Resend Registration Successful for Mathrix'19")
  	end
end
