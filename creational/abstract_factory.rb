# frozen_string_literal: true

# Abstract Factory is a creational design pattern that lets you produce families of related objects
# without specifying their concrete classes.
# @see: https://refactoring.guru/design-patterns/abstract-factory
module Entities
  module Chairs
    class Chair
      def message = raise NotImplementedError
      def sit_on = puts message
    end

    class VictorianChair < Chair
      def message = "Sittin' with class on a Victorian Chair."
    end

    class ModernChair < Chair
      def message = "Levitatin' on a Modern Chair."
    end
  end

  module Sofas
    class Sofa
      def message = raise NotImplementedError
      def sleep_on = puts message
    end

    class VictorianSofa < Sofa
      def message = "Sittin' with class on a Victorian Sofa."
    end

    class ModernSofa < Sofa
      def message = "Sleepin' lazily on a Modern Sofa."
    end
  end
end

module Factories
  class FurnitureFactory
    def create_chair = raise NotImplementedError
    def create_sofa = raise NotImplementedError
  end

  class VictorianFactory < FurnitureFactory
    def create_chair = Entities::Chairs::VictorianChair.new
    def create_sofa = Entities::Sofas::VictorianSofa.new
  end

  class ModernFactory < FurnitureFactory
    def create_chair = Entities::Chairs::ModernChair.new
    def create_sofa = Entities::Sofas::ModernSofa.new
  end
end

Factories::ModernFactory.new.create_chair.sit_on
Factories::VictorianFactory.new.create_sofa.sleep_on
