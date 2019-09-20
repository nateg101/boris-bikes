class Bike

attr_accessor :broken
# attr_accessor :working

  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end

end
