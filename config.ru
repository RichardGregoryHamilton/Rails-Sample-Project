# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack-zippy'
asset_root = '/games/app/assets

use Rack::Zippy::AssetServer, asset_root