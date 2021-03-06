require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MinimalCalendar
  class Application < Rails::Application
    # Settings in config/environments/* take precedence
    # over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone
    # and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = "Eastern Time (US & Canada)"

    # The default locale is :en and all translations from
    # config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path +=
    # Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    #
    # config.i18n.default_locale = :de

    # The name of your site.
    config.site_name = "Minimal Calendar"

    # SEO - The site description (what shows up on search engines)
    config.meta_description = ""

    # SEO - The meta keywords
    config.meta_keywords = [
      ""
    ]
  end
end
