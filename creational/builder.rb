# frozen_string_literal: true

# Builder is a creational design pattern that lets you construct complex objects step by step.
# The pattern allows you to produce different types and representations of an object using the same construction code.
# @see: https://refactoring.guru/design-patterns/builder

module Entities
  module Engines
    class Engine; end
    class MightyEngine < Engine; end
    class SwiftEngine < Engine; end
  end

  module GPS
    class BaseGPS; end
    class WirelessGPS < BaseGPS; end
    class WiredGPS < BaseGPS; end
  end

  class Car
    attr_accessor :seats, :engine, :gps
  end

  class CarManual
    attr_accessor :seats, :engine, :gps
  end
end

module Builders
  class Builder
    def initialize = reset
    def reset = raise NotImplementedError
    def with_seats(seats) = raise NotImplementedError
    def with_engine(engine) = raise NotImplementedError
    def with_gps(gps) = raise NotImplementedError
    def retrieve! = raise NotImplementedError
  end

  class CarBuilder < Builder
    def reset
      @car = Entities::Car.new
    end

    def with_seats(seats)
      @car.seats = seats
      self
    end

    def with_engine(engine)
      @car.engine = engine
      self
    end

    def with_gps(gps)
      @car.gps = gps
      self
    end

    def retrieve!
      car = @car
      reset
      car
    end
  end

  class CarManualBuilder < Builder
    def reset
      @car_manual = Entities::CarManual.new
    end

    def with_seats(seats)
      @car_manual.seats = "The Car has #{seats} seats."
      self
    end

    def with_engine(engine)
      @car_manual.engine = "The Car boasts a #{engine.class.to_s.split('::').last}."
      self
    end

    def with_gps(gps)
      @car_manual.gps = "It has a #{gps.class.to_s.split('::').last}."
      self
    end

    def retrieve!
      car_manual = @car_manual
      reset
      car_manual
    end
  end
end

class CarDirector
  def build_suv(builder)
    builder
      .with_seats(5)
      .with_engine(Entities::Engines::MightyEngine.new)
      .with_gps(Entities::GPS::WirelessGPS.new)
      .retrieve!
  end

  def build_sports_car(builder)
    builder
      .with_seats(2)
      .with_engine(Entities::Engines::SwiftEngine.new)
      .with_gps(Entities::GPS::WirelessGPS.new)
      .retrieve!
  end
end

car_director = CarDirector.new
car_builder = Builders::CarBuilder.new
car_manual_builder = Builders::CarManualBuilder.new

puts 'Car'
p car_director.build_suv(car_builder)
p car_director.build_suv(car_manual_builder)
puts "\n"

puts 'Car Manual'
p car_director.build_sports_car(car_builder)
p car_director.build_sports_car(car_manual_builder)
