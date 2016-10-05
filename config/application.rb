require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rorcms
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  config.autoload_paths = %W(#{config.root}/app/models/ckeditor)
  config.assets.precompile += %w( style.css )
config.assets.precompile += %w( code.js )
config.assets.precompile += %w( jquery.js )
config.assets.precompile += %w( ckeditor.js )
config.assets.precompile += %w( jquery.complexify.js )
config.assets.precompile += %w( script.js )
config.assets.precompile += %w( meter.css )
config.assets.precompile += %w( business-casual.css )


config.assets.precompile += %w( bootstrap.css )
config.assets.precompile += %w( animate.css )
config.assets.precompile += %w( font-awesome.min.css )
config.assets.precompile += %w( slick.css )
config.assets.precompile += %w( freeze.css )
config.assets.precompile += %w( settings.css )
config.assets.precompile += %w( jquery-1.11.1.min.js )
config.assets.precompile += %w( bootstrap.min.js )
config.assets.precompile += %w( slick.min.js )
config.assets.precompile += %w( placeholdem.min.js )
config.assets.precompile += %w( waypoints.min.js )
config.assets.precompile += %w( scripts.js )
config.assets.precompile += %w( ck/ckeditor.js )
config.assets.precompile += %w( rs-plugin/js/jquery.themepunch.plugins.min.js )
config.assets.precompile += %w( rs-plugin/js/jquery.themepunch.revolution.min.js )

config.assets.precompile += %w( bootstrap.min.css )
config.assets.precompile += %w( modern-business.css )
config.assets.precompile += %w( bootstrap.js )
config.assets.precompile += %w( contact_me.js )
config.assets.precompile += %w( jqBootstrapValidation.js )

config.assets.precompile += %w( skel-noscript.css )
config.assets.precompile += %w( style-desktop.css )
config.assets.precompile += %w( style3.css )
config.assets.precompile += %w( init.js )
config.assets.precompile += %w( skel-panels.js )
config.assets.precompile += %w( skel.min.js )

  end
end
