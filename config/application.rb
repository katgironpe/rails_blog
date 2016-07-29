require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework  :rspec
      g.stylesheets     false
      g.javascripts     false
      g.template_engine :slim
      g.factory_girl dir: 'spec/factories'
    end

    config.assets.paths << Rails.root.join('bower_components')
  end
end
