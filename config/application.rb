require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    config.eager_load_paths += %W(#{config.root}/lib)
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    config.time_zone = 'Beijing'
  end
end
