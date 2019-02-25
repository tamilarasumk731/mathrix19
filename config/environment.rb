# Load the Rails application.
require_relative 'application'
require 'rqrcode'
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# config.action_mailer.delivery_method = :smtp

# config.action_mailer.smtp_settings = {
#    address:              'smtp.gmail.com',
#    port:                 587,
#    domain:               'gmail.com',
#    user_name:            'mathrixannauniv@gmail.com',
#    password:             'Mathrix@2019',
#    authentication:       'plain',
#    enable_starttls_auto: true  
# }
# ActionMailer::Base.default_content_type = "text/html"
