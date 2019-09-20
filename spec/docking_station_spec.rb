require "docking_station"

describe DockingStation do

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations not to release broken bikes.
    it "report no working bikes" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No working bikes"
    end

  it "should accept a user specified value for docking capacity" do
    dock = DockingStation.new(25)
    expect(dock.capacity).to eq(25)

  end

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


  it "raises error if capacity is breached" do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error "No space available"
  end

  it "has a variable capacity" do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error "No space available"
  end

  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  # Testing the :dock method
  describe "#dock()" do
    it "docks a bike and confirms by returning the bike reference" do
      bike = Bike.new
      expect(subject.dock(bike).last).to eq bike
    end
  end

    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when there are no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

end
