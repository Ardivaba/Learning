# While loop
x = 1
while x <= 10
  puts "While: #{x}"
  x += 1
end

puts

# Times loop
x = 0
10.times do
  x += 1
  puts "Times loop: #{x}"
end

puts

x = 1
loop do
  puts "Loop: #{x}"
  x += 1
  break unless x <= 10
end
