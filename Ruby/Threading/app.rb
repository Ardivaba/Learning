require 'thread'

threads = (1..100).map do |number|
  Thread.new do
    sleep 0.5
    print "\nThread finished: #{number}"
  end
end

threads.each do |thread|
  thread.join
end
