Airbrake.configure do |config|
  config.host = ENV['ERRBIT_HOST']
  config.project_id = true
  config.project_key = ENV['ERRBIT_API_KEY']
  config.root_directory = Rails.root
  config.logger = Rails.logger
  config.environment = Rails.env
  config.ignore_environments = [:test]
end
