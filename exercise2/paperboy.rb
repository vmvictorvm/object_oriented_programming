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
    val = @experience/2.0 + 50.0
    return val.round
  end

#Helper method to determine odd/even number
  def currentSide(num)
    if num%2 == 0
      return "even"
    else
      return "odd"
    end
  end


  def deliver(start_address, end_address)
    if start_address <= end_address
      i = start_address
      total = 0
      delivered = 0
      while i <= end_address do
        if currentSide(i) == @side
          delivered += 1
          if delivered <= quota
            total += 0.25
          elsif delivered > quota
            total += 0.5
          end
        end
        i += 1
      end
      @experience += delivered
      @earnings += total
      return total
    else
      puts "Error: Start address cannot be greater than end address"
    end
  end

  def report
    return "I'm #{@name}, I've delivered #{@experience} papers and I've earned #{@earnings} so far!"
  end
end

tommy = Paperboy.new("Tommy", "even")

puts tommy.quota # => 50
puts tommy.deliver(101, 220) # => 17.75
puts tommy.earnings #=> 17.5
pBoyMessage = tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"
puts pBoyMessage

puts "\n"

puts tommy.quota # => 80
puts tommy.deliver(1, 150) # => 18.75
puts tommy.earnings #=> 36.25
pBoyMessage = tommy.report # => "I'm Tommy, I've been delivered 134 papers and I've earned $36.25 so far!"
puts pBoyMessage
