require 'thread'

queue = Queue.new

threads = (1..100).map do |number|
  Thread.new do
    sleep 0.5
    queue.push number
  end
end

printer = Thread.new do
  loop do
    number = queue.pop
    puts number
  end
end

printer.join

threads.each do |thread|
  thread.join
end
