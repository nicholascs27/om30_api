require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Om30Api
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.time_zone = "America/Fortaleza"

    config.i18n.default_locale = :"pt-BR"
    config.i18n.available_locales = %w(pt-BR)
    I18n.enforce_available_locales = false

    config.action_mailer.default_url_options = { host: Figaro.env.email_server.to_s }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: Figaro.env.email_server.to_s,
      port: 587,
      user_name: Figaro.env.email_username.to_s,
      password: Figaro.env.email_password.to_s,
      authentication: :plain,
      enable_starttls_auto: true
    }

    config.api_only = true
  end
end
