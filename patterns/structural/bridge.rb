# frozen_string_literal: true

# Bridge is a structural design pattern that lets you split a large class or a set of closely related classes
# into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.
#
# @see https://refactoring.guru/design-patterns/bridge
class SomeOperation
  def call
    tv = TV.new
    remote = Remote.new(tv)
    remote.toggle_power
    remote.volume_up
    remote.volume_down

    radio = Radio.new
    remote = AdvancedRemote.new(radio)
    remote.toggle_power
    remote.volume_down
    remote.mute
  end
end

class Remote
  def initialize(device)
    @device = device
  end

  def toggle_power
    @device.toggle_power
  end

  def volume_up
    @device.volume += 10
  end

  def volume_down
    @device.volume -= 10
  end

  def channel_up
    @device.channel += 1
  end

  def channel_down
    @device.channel -= 1
  end
end

class AdvancedRemote < Remote
  def mute
    @device.volume = 0
  end
end

class Device
  attr_accessor :volume, :channel

  def toggle_power
    raise NotImplementedError
  end
end

class Radio < Device
  def toggle_power
    @enabled = !@enabled
  end
end

class TV < Device
  def toggle_power
    @enabled = !@enabled
  end
end
