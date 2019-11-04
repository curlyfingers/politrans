require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Politrans
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = "UTC"
    config.active_record.default_timezone = :utc

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.smtp_settings = {
      address:              Rails.application.credentials.smtp[:address],
      port:                 587,
      domain:               Rails.application.credentials.smtp[:domain],
      user_name:            Rails.application.credentials.smtp[:username],
      password:             Rails.application.credentials.smtp[:password],
      authentication:       :plain,
      enable_starttls_auto: true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
