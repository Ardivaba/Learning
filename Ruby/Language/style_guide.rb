# Two spaces
def good_method
  puts 'Good method'
end
good_method

# Don't use ; to seperate statements
puts 'foobar'
puts 'foo'
puts 'bar'
puts 'foo', 'bar'

# Good single line class
FooError = Class.new(StandardError)

# Avoid single line methods...
def meh
  print 'Meh, avoiding single line methods...'
end
meh

def no_op; end
