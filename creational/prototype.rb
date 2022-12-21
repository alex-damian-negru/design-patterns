# frozen_string_literal: true

# Prototype is a creational design pattern that lets you copy existing objects
# without making your code dependent on their classes.
#
# @see https://refactoring.guru/design-patterns/prototype
class SomeClass
  def initialize
    @property = 'some value'
    @another_property = { some: 'value', another: { deep: NestedClass.new } }
  end
end

class NestedClass
  def initialize
    @property = 'some value'
    @another_property = { some: 'value', another: { deep: 'value' } }
  end
end

object = SomeClass.new

puts 'Real object'
puts object.inspect

puts 'Duped object'
puts object.dup.inspect

puts 'Cloned object'
puts object.clone.inspect
