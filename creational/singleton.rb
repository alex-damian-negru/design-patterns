# frozen_string_literal: true

require 'singleton'

class Database
  include Singleton # singleton for lazy Rubyists ¯\_(ツ)_/¯
end

object1 = Database.instance
object2 = Database.instance

puts 'Corporate wants you to find the difference between these objects'
puts 'They are the same object' if object1 == object2
