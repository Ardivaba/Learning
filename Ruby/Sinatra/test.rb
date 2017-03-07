require_relative "app.rb"
require "test/unit"
require "rack/test"

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_post_create
    get "/create/:title/:body", :title => "Some", :body => "Memes"
    assert last_response.ok?
    assert_equal "<h1>:title</h1><p>:body</p>", last_response.body
  end

  def test_post_delete
    get "/delete/:title", :title => "Some"
    assert last_response.ok?
    assert_equal "Posts with :title removed", last_response.body
  end
end
