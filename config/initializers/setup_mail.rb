
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :domain               => "youse.com.br",
  :user_name            => "suptools@youse.com.br'",
  :password             => "MKclzv5rdC7bTK7E_UHDfQ",
  :authentication       => 'login',
  :enable_starttls_auto => true
}

# ActionMailer::Base.default_url_options[:host] = "localhost:3000"
