# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SamofundNet::Application.initialize!

require 'samofund/auth_token_generator'