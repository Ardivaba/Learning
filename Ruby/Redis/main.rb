require "redis"
require "json"

redis = Redis.new(:host => "127.0.0.1", :port => 6379, :timeout => 1)

redis.publish "news", "Hello World"

redis.subscribe "news" do |on|
  on.message do |channel, message|
    print message
  end
end

redis.publish "news", "Hello World"
