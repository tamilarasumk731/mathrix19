class UserMailer < ApplicationMailer
	default from: "mathrixannauniv@gmail.com"

	def registration(user, qr)
	    @user = user
	    @qr = qr
	    mail(to: @user.email, subject: 'Registration Successful')
  	end

  	def resend(user, qr)
	    @user = user
	    @qr = qr
	    mail(to: @user.email, subject: 'Resend Registration Successful')
  	end
end
