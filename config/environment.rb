# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rnr::Application.initialize!

Rnr::Application.configure do
  config.is_in_production = false
end