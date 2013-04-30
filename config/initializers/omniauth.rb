OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '570128136341521', 'a0b0e4dc889cc60734bea1376db22a1e',
           :scope => 'email,read_stream', :display => 'popup'
end