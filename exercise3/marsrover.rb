class MarsRover
  attr_accessor :xCoord
  attr_accessor :yCoord
  attr_accessor :direction


  def initialize(xCoord, yCoord, direction)
      @xCoord = xCoord
      @yCoord = yCoord
      @direction = direction
  end


  def read_instruction
    puts "Please enter your input"

    # Converting string to array
    inputString = gets.chomp
    inputArray =  inputString.split("")

    inputArray.each do |i|
      if i == "L"
          turn("L")
      elsif i == "R"
          turn("R")
      elsif i == "M"
          move
      end
    end
  end


  # This method will chnage the X, Y coordinate
  def move
    if @direction == "N"
      @yCoord += 1
    elsif @direction == "S"
      @yCoord -= 1
    elsif @direction == "W"
      @xCoord -= 1
    elsif @direction == "E"
      @xCoord += 1
    else
      puts "Invalid direction"
    end
  end

  # This method will change the Direction of the rover
  def turn(dir)
    case @direction
    when "N"
      if dir == "L"
        @direction = "W"
      elsif dir == "R"
        @direction = "E"
      end
    when "S"
      if dir == "L"
        @direction = "E"
      elsif dir == "R"
        @direction = "W"
      end
    when "E"
      if dir == "L"
        @direction = "N"
      elsif dir == "R"
        @direction = "S"
      end
    when "W"
      if dir == "L"
        @direction = "S"
      elsif dir == "R"
        @direction = "N"
      end
    else
      "Invalid direction"
    end
  end



end

# Getting plateau size input from user in this format "5 5"
puts "Please enter plateau size. e.g: 5 5"
plateauSizeInput = gets.chomp
plateauSizeArray =  inputString.split(" ")

puts "Please enter initial rover location"
initRoverLocationInput = gets.chomp
initRoverLocationInputArray = initRoverLocationInput.split(" ")




rover1 = MarsRover.new(p,,"N")
#rover1.read_instruction
#puts rover1.xCoord
#puts rover1.yCoord
#puts rover1.direction
