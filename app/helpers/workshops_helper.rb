module WorkshopsHelper

	def pay_for_workshop(user)

		headers = {"X-Api-Key" => ENV["X_Api_Key"], "X-Auth-Token" => ENV["X_Auth_Token"]}
		payload = {
		  purpose: ENV["PURPOSE"],
		  amount: ENV["AMOUNT"],
		  buyer_name: user.name,
		  email: user.email,
		  phone: "+91#{user.mobile}",
		  redirect_url: ENV["REDIRECT_URL"],
		  send_email: true,
		  send_sms: true,
		  webhook: ENV["WEBHOOK_URL"],
		  allow_repeated_payments: false,
		}
		conn = Faraday.new(:url => ENV["INSTAMOJO_URL"], :headers => headers)
		response = conn.post 'payment-requests/', payload
		return JSON.parse(response.body)
	end

end