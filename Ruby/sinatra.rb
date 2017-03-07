require 'sinatra'

require 'rubygems'
require 'data_mapper'
require 'dm-migrations'
require 'dm-sqlite-adapter'

# Api module
module Api
  # Start service
  # Added comment...
  def start()
    ApiObject.new
  end
end
