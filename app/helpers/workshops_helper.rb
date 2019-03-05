module WorkshopsHelper

	def pay_for_workshop(user)

		headers = {"X-Api-Key" => "test_f25908504a7265cfc0b9263795f", "X-Auth-Token" => "test_6f8b21f9efee45a0ed3283694a3"}
		payload = {
		  purpose: "Mathrix 19 Workshop",
		  amount: "450",
		  buyer_name: user.name,
		  email: user.email,
		  phone: "+91#{user.mobile}",
		  redirect_url: 'http://check.mathrix.in',
		  send_email: true,
		  send_sms: true,
		  webhook: 'https://783e1eba.ngrok.io/api/v1/workshops/update',
		  allow_repeated_payments: false,
		}
		conn = Faraday.new(:url => 'https://test.instamojo.com/api/1.1/', :headers => headers)
		response = conn.post 'payment-requests/', payload
		return JSON.parse(response.body)
	end

end