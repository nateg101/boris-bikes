require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
  end

  def release_bike
    raise('No bikes available') if empty?

    @bikes.pop
  end

  def dock(bike)
    raise('No space available') if full?

    @bikes << bike
  end

  private

  def full?
    if @bikes.count >= DEFAULT_CAPACITY
      true
    else
      false
    end
  end

  def empty?
    if @bikes.empty?
      true
    else
      false
    end
  end
end
