class Cat
  attr_accessor :name
  attr_accessor :preferred_food
  attr_accessor :meal_time

  def initialize(name,preferred_food,meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

end

cat1 = Cat.new("Ruby", "pizza", "2")
cat2 = Cat.new("Jacky", "rice", "3")
