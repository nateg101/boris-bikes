require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end
  def release_bike
    fail("No bikes available") if @bikes.empty?
    @bikes
  end
  def dock(bike)
    fail("No space available") if @bikes.count >= 20
    @bikes << bike
  end
attr_reader :bikes
end
