# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

unless Rails.env.production?
  require 'dotenv'
  Dotenv.load
end
