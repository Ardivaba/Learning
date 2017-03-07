require "sinatra"
require "sinatra/reloader"
require "redis"
require "data_mapper"

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text
    property :created_at, DateTime
end

DataMapper.finalize

Post.auto_upgrade!

redis = Redis.new(:host => "127.0.0.1", :port => 6379)

get "/" do
  erb :index
end

get "/create/:title/:body" do
  post = Post.create(:title => params[:title], :body => params[:body], :created_at => Time.now)
  post.save
  %{<h1>#{params[:title]}</h1><p>#{params[:body]}</p>}
end

get "/delete/:title" do
  posts = Post.all(:title => params[:title])
  posts.destroy
  "Posts   with #{params[:title]} removed"
end

get "/list" do
  @posts = Post.all
  erb :index
end

get "/env", {}, :hello => "World" do
  params[:Hello]
end











# Eof
