class MarsRover
  attr_accessor :xCoord
  attr_accessor :yCoord
  attr_accessor :direction
  attr_accessor :xMax
  attr_accessor :yMax


  def initialize(xCoord, yCoord, direction)
      @xCoord = xCoord
      @yCoord = yCoord
      @direction = direction
  end


  def read_instruction(inputArray)
    #puts "Please enter your instructions: L = Left, R = Right and M = Move"

    # Converting string to array
    #inputString = gets.chomp
    #inputArray =  inputString.split("")

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


  # This method will change the X, Y coordinate
  def move
    if @direction == "N" && (@yCoord + 1) <= @yMax
      @yCoord += 1
    elsif @direction == "S" && (@yCoord - 1) >= 0
      @yCoord -= 1
    elsif @direction == "W" && (@xCoord - 1) >= 0
      @xCoord -= 1
    elsif @direction == "E" && (@xCoord + 1) <= @xMax
      @xCoord += 1
    else
      puts "You cannot move outside of the plateau!"
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


puts "Please provide user input.  Type 'END' to ended your input"
$/ = "END"
user_input = STDIN.gets
#raise user_input.inspect
#raise user_input.each_line.inspect
i =0
user_input.split("\n").each do |line|
  next if line == "END"
    #puts line.inspect
    i += 1
    if i == 1  #If it is the very first line, then this is the plateau size
      plateauSizeInput = line
      @plateauSizeArray =  plateauSizeInput.split(" ")
    elsif i == 2  #If even # --> Current position of the rover
      initRoverLocationInput = line
      @initRoverLocationInputArray = initRoverLocationInput.split(" ")
    elsif i == 3 # odd # ----> This line is the instructions for the rover
      inputString = line
      @inputArray =  inputString.split("")
    elsif i == 4
      initRoverLocationInput = line
      @initRoverLocationInputArray2 = initRoverLocationInput.split(" ")
    elsif i == 5
      inputString = line
      @inputArray2 =  inputString.split("")
    end
end

rover1 = MarsRover.new(@initRoverLocationInputArray[0].to_i,@initRoverLocationInputArray[1].to_i,@initRoverLocationInputArray[2])
#Immediately after create the object, set the plateau size for max x and y coordinate
rover1.xMax = @plateauSizeArray[0].to_i
rover1.yMax = @plateauSizeArray[1].to_i
rover1.read_instruction(@inputArray)

puts "Rover 1: #{rover1.xCoord} #{rover1.yCoord} #{rover1.direction}"


rover2 = MarsRover.new(@initRoverLocationInputArray2[0].to_i,@initRoverLocationInputArray2[1].to_i,@initRoverLocationInputArray2[2])
#Immediately after create the object, set the plateau size for max x and y coordinate
rover2.xMax = @plateauSizeArray[0].to_i
rover2.yMax = @plateauSizeArray[1].to_i
rover2.read_instruction(@inputArray2)

puts "Rover 2: #{rover2.xCoord} #{rover2.yCoord} #{rover2.direction}"


### Alternate input ###
# Getting plateau size input from user in this format "5 5"
#puts "Please enter plateau size. e.g: 5 5"
#plateauSizeInput = gets.chomp
#plateauSizeArray =  plateauSizeInput.split(" ")

#puts "Please enter initial rover location"
#initRoverLocationInput = gets.chomp
#initRoverLocationInputArray = initRoverLocationInput.split(" ")

#rover1 = MarsRover.new(initRoverLocationInputArray[0].to_i,initRoverLocationInputArray[1].to_i,initRoverLocationInputArray[2])
#Immediately after create the object, set the plateau size for max x and y coordinate
#rover1.xMax = plateauSizeArray[0].to_i
#rover1.yMax = plateauSizeArray[1].to_i

#rover1.read_instruction
#puts "The rover1 current direction is #{rover1.xCoord} #{rover1.yCoord} #{rover1.direction}"
