class UserMailer < ApplicationMailer
	default from: "mathrixannauniv@gmail.com"

	def registration(user, qr)
    @user = user
    @qr = qr
    mail(to: @user.email, subject: 'Registration Successful')
  end
end
