require "docking_station"

describe DockingStation do

  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike.last
    expect(bike).to be_working
  end

  # Testing the :dock method
  describe "#dock()" do
    it "docks a bike and confirms by returning the bike reference" do
      bike = Bike.new
      expect(subject.dock(bike).last).to eq bike
    end

    it "raises an error when full capacity" do

      # times = 1
      # while times <= subject.DEFAULT_CAPACITY do
      #   subject.dock(Bike.new)
      #   times += 1
      # end

      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end

      expect { subject.dock(Bike.new) }.to raise_error "No space available"



    end
  end

  # Test accessing the @bike instance variable
  it "returns bike when looking for a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  # Testing the :release_bike method
  describe '#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike.last).to eq bike
    end
    it "raises an error when there are no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

end
