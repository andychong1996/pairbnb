OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "107093756321464", "a61413b1aab3dc07f355e197e6993528",
  info_fields: 'email, first_name, last_name'
end
