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

  def deliver(start_address, end_address)
    if start_address <= end_address
      i = start_address
      total = 0
      while i <= end_address do
        if i <= quota
          total += 0.25
        elsif i > quota
          total += 0.5
        end
        i += 2
      end
      return total
    else
      puts "Error: Start address cannot be greater than end address"
    end
  end

end

pBoy1 = Paperboy.new("David", 80, "even", 80)
puts pBoy1.quota
puts pBoy1.deliver(66,66)
