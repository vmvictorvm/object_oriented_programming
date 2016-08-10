class Paperboy
  attr_accessor :name
  attr_accessor :experience
  attr_accessor :side
  attr_accessor :earnings

  def initialize(name,experience,side,earnings)
    @name = name
    @experience = experience
    @side = side
    @earnings = earnings
  end

  def quota
    return @experience/2 + 50
  end
end

pBoy1 = Paperboy.new("David", 80, "even", 80)
puts pBoy1.quota
