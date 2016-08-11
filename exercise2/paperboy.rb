class Paperboy
  attr_accessor :name
  attr_accessor :experience
  attr_accessor :side
  attr_accessor :earnings

  def initialize(name,side)
    @name = name
    @experience = 0
    @side = side
    @earnings = 0
  end

  def quota
    return @experience/2 + 50
  end

  def deliver(start_address, end_address)
    if start_address <= end_address
      i = start_address
      total = 0
      count = 0
      while i <= end_address do
        count += 1
        if count <= quota
          total += 0.25
        elsif count > quota
          total += 0.5
        end
        i += 2
      end
      @experience += count
      @earnings += total
      return total
    else
      puts "Error: Start address cannot be greater than end address"
    end
  end

end

tommy = Paperboy.new("Tommy", "even")

puts tommy.quota # => 50
puts tommy.deliver(101, 220) # => 17.75
puts tommy.earnings #=> 17.5
#tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"

puts tommy.quota # => 80
puts tommy.deliver(1, 150) # => 18.75
puts tommy.earnings #=> 36.25
#tommy.report # => "I'm Tommy, I've been delivered 134 papers and I've earned $36.25 so far!"
