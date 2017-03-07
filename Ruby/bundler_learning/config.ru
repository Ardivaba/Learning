require "rubygems"
require "bundler"

Bundler.require

require "./exe/app"

run Sinatra::Application
