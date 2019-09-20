class Bike

attr_reader :broken

  def working?
    true
  end

  def broken?
    @broken = true
  end

  def report_broken
    @broken
  end

end
