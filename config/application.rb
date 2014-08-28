require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Games
  class Application < Rails::Application
 
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
	config.exceptions_app = self.routes
	config.force_ssl = true
	
	config.cache_store = :memory_store
	Rails.application.config.middleware.swap(ActionDispatch::Static, Rack::Zippy::AssetServer, Rails.public_path)
	
  end
end
