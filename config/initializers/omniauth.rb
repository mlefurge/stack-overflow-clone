OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['SOFC_FB_ID'], ENV['SOFC_FB_SECRET'], {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  provider :google_oauth2, ENV['SOFC_GG_ID'], ENV['SOFC_GG_SECRET'], {:scope => 'email,profile'}
end
