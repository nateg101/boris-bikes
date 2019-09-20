require "bike"

describe Bike do

  it "responds to the working? method" do
    expect(subject).to respond_to :working?
  end

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  it "should allow a bike to reported as being broken" do
    subject.report_broken
    expect(subject).to be_broken
  end

end
