require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes #, :DEFAULT_CAPACITY

  def initialize

    @bikes = []
  end

  def release_bike
    fail("No bikes available") if empty?
    @bikes
  end

  def dock(bike)
    fail("No space available") if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
