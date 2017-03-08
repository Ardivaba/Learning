require_relative "Oop/version"
require_relative "person"

require "singleton"
require "forwardable"

class BankApp
  include Singleton

  class << self
    extend Forwardable
    def_delegators :instance, :start, :add_person
  end

  def start
    @people = []
    puts "BankApp started."
  end

  def add_person(name, money)
    person = Person.new(name, money)
    @people.push(person)
    puts "Added person #{name} with the initial amount of money of: #{money}."
  end
end
