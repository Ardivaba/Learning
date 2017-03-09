require 'thread'

lock = Mutex.new
threads = (1..100).map do |number|
  Thread.new do
    sleep 0.5
    lock.lock
    print "\nThread finished: #{number}"
    lock.unlock
  end
end

threads.each do |thread|
  thread.join
end
