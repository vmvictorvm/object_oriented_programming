class Cat
  attr_accessor :name
  attr_accessor :preferred_food
  attr_accessor :meal_time

  def initialize(name,preferred_food,meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

#Convert 0 to 23 to proper time e.g: 11pm
  def eats_at
    if @meal_time < 12
      val = @meal_time.to_s + " AM"
    elsif @meal_time >= 12 && @meal_time < 24
      val = @meal_time - 12
      val = val.to_s + " PM"
    else
      puts "Invalid time"
    end
    return val
  end

  def meow
    return "My name is #{@name} and I eat #{@preferred_food} at #{eats_at}"
  end



end

#Create two cats
cat1 = Cat.new("Ruby", "pizza", 11)
cat2 = Cat.new("Jacky", "rice", 15)

#Testing the eats_at method
puts cat1.eats_at
puts cat2.eats_at

#Calling the meow method
cat1Message = cat1.meow
cat2Message = cat2.meow

puts cat1Message
puts cat2Message
