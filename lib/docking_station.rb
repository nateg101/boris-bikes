require_relative 'bike'

class DockingStation
  attr_reader :bikes
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
    if @bikes.count >= 20
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
