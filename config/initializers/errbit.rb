Airbrake.configure do |config|
  config.api_key = ENV['ERRBIT_API_KEY']
  config.host    = ENV['ERRBIT_HOST']
  config.port    = 8080
  config.secure  = config.port == 443
  config.environment_name = Rails.env.production? ? `hostname` : Rails.env
end
