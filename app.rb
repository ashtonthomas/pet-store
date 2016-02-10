# load bundler
require 'bundler/setup'
Bundler.setup(:default)
require 'napa/setup'

# getting: undefined method mattr_accessor'
# https://github.com/rails/rails/issues/22305#issuecomment-164658921
# require below as a work around
require 'active_support/core_ext/module/attribute_accessors'

Bundler.require(:default, Napa.env.to_sym)
require 'napa'

# load environment
Napa.load_environment

# autoload initalizers
Dir['./config/initializers/**/*.rb'].map { |file| require file }

# load middleware configs
Dir['./config/middleware/**/*.rb'].map { |file| require file }

# Load components
Dir['./components/**/**/*.rb'].map { |file| require file }

# Load
Dir['./lib/components_api/**/**/*.rb'].map { |file| require file }

# autoload app
relative_load_paths = %w(app/apis app/representers app/models app/workers lib)
ActiveSupport::Dependencies.autoload_paths += relative_load_paths
