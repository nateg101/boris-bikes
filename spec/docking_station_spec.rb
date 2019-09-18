require "docking_station"

describe DockingStation do

  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe "#dock()" do
    it "docks a bike and confirms by returning the bike reference" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it "raises an error when full capacity" do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error "No space available"
    end
  end

  it "returns bike when looking for a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end


  describe '#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it "raises an error when there are no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end
end
