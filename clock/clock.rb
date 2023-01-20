=begin
------ P
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time 
represented by a given Clock object.  Note that you should not mutate 
Clock objects when adding and subtracting minutes -- create a new `Clock`
object.

Two clock obects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality, just use arithmetic 
operators.

Input
- Integers representing hours and minutes

Output
- a string representing the time

Rules
Implicit:
- if given two integers, the first represents the hour while the second represents
  minutes
- time is in military time

Explicit
- two clock objects that represent the same time should be equal to each other
  - need to define a custom `==` method?
- should be able to add or subtract minutes from the time by a given Clock object,
but this should not mutate the Clock object, but make a new one.
------ E
see clock_test.rb
------ D
class Clock
  def initialize
    @minutes = 0
  end

  def self.at(*ints)
    new_clock = Clock.new
    new_clock.minutes += (ints[0] * 60)
    new_clock.minutes += ints.size > 1 ? ints[1] : 0
    new_clock
  end

  def +(int)
    Clock.at(0, int)
  end

  def -(int)
    Clock.at(0, -int)
  end

  def to_s
  end

  def ==
  end

  private 

  attr_writer :minutes

  protected

  attr_reader :minutes
end
------ A
initialize
1. initialize and assign @minutes to 0

at(*ints)
1. initialize new_clock to a new Clock object
1. reassign @minutes for new_clock to the result of multiplying the first value 
passed into the method as an argument by 60 
2. reassign @minutes for new_clock to the result of adding the second argument 
provided to the method to itself (if a second argument is provided), zero otherwise

+(int)
1. instantiate a new Clock object and invoke the self.at method with 0 and int 
passed in as arguments 

-(int)
1. instantiate a new Clock object and invoke the self.at method with 0 and negative
int passed in as arguments 

to_s
1. initialize and assign hours, minutes to the result of standardized_time

standardized_time
1. initialize and assign current_minutes to @minutes
2. until current_minutes is less than or equal to 1440, subtract 1440
from current_minutes
3. divide current_minutes by 60 and place the divided amount and any remainder
into an array



==(other_clock)
1. Check if @minutes is the same for the calling object and the object passed in 
as an argument
------ C
=end
class Clock
  attr_accessor :minutes

  def initialize
    @minutes = 0
  end

  def self.at(*ints)
    new_clock = Clock.new
    new_clock.minutes += (ints[0] * 60)
    new_clock.minutes += ints.size > 1 ? ints[1] : 0
    new_clock
  end

  def +(int)
    new_minutes = @minutes + int
    new_minutes -= 1440 until new_minutes <= 1440
    Clock.at(0, new_minutes)
  end

  def -(int)
    new_minutes = @minutes - int
    new_minutes += 1440 until new_minutes >= 0
    Clock.at(0, new_minutes)
  end

  def to_s
    hours, minutes = @minutes.divmod(60)
    format('%02d:%02d', hours, minutes)
  end

  def ==(other_clock)
    minutes == other_clock.minutes
  end
end

p clock = Clock.at(23, 30) + 60
