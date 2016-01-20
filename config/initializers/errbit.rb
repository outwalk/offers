Airbrake.configure do |config|
  config.host = ENV['ERRBIT_HOST']
  config.project_id = true
  config.project_key = ENV['ERRBIT_API_KEY'] || 'test_project_key'
  config.root_directory = Rails.root
  config.logger = Rails.logger
  config.environment = Rails.env
  config.ignore_environments = [:test, :development]
end

module Airbrake
  IGNORE_ONLY = %w(
    AbstractController::ActionNotFound
    ActiveRecord::RecordNotFound
    ActionController::RoutingError
    ActionController::InvalidAuthenticityToken
    ActionController::UnknownAction
    ActionController::UnknownHttpMethod
    CGI::Session::CookieStore::TamperedWithCookie
    Mongoid::Errors::DocumentNotFound
    ActionController::UnknownFormat
  )
end

Airbrake.add_filter do |notice|
  if notice[:errors].any? { |error| error[:type].in? ::Airbrake::IGNORE_ONLY }
    notice.ignore!
  end
end
