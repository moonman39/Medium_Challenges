=begin
------ P
Given two integers representing a year and a month, along with two strings representing
a day of the week and a descriptor for a type of day in a month (first, last, etc.), return 
the date that all four inputs create.  

- For example, if you ask for the 2nd Wednesday of May 2021, the return value should be 
the 12th of May, 2021. 

Descriptors that may be given strings:
'first' 'second' 'third' 'fourth' 'fifth' 'first' 'last' 'teenth'
'Monday' 'Tuesday' ... 'Sunday'

Rules
Explicit:
- the case of the strings is not important

Implicit:
- if no such date exists for the given inputs, return nil
------ E
see meetings_test.rb
------ D
class Meetup
  def initialize(year, month)
  end

  def day(weekday, descriptor)
  end
end

@days = {
  'monday' => Proc.new { |day| day.monday? },
  'tuesday' => Proc.new { |day| day.monday? },
  'wednesday' => Proc.new { |day| day.monday? },
  ...
}

------ A
Initial thoughts:
- do a range from 1-31 and cycle through each date of the month
  - say we are looking the 3rd monday of a month.  We could cycle through each day of 
  the month and push a certain day to an array if it is a monday using some method of 
  Date that checks for monday
- teenth 

initialize(year, month)
1. initialize and assign @year to year and @month to month
2. initialize and assign @days to a hash where each key is a day of the week and its 
value is a proc object which checks whether a given day is a monday, tuesday, etc.

day(weekday, descriptor)
1. 
------ C
=end
require 'date'

class Meetup
  def initialize(year, month)
    @year, @month = year, month
    @final_day = Date.civil(@year, @month, -1).day

    @days = {
      'monday' => Proc.new { |day| day.monday? },
      'tuesday' => Proc.new { |day| day.tuesday? },
      'wednesday' => Proc.new { |day| day.wednesday? },
      'thursday' => Proc.new { |day| day.thursday? },
      'friday' => Proc.new { |day| day.friday? },
      'saturday' => Proc.new { |day| day.saturday? },
      'sunday' => Proc.new { |day| day.sunday? },
    }

    @descriptors = {
      'first' => 0,
      'second' => 1,
      'third' => 2,
      'fourth' => 3,
      'fifth' => 4,
      'last' => -1 
    }
  end

  def day(weekday, descriptor)
    weekdays = (1..@final_day).map { |day| Date.civil(@year, @month, day) }.select(&@days[weekday.downcase])
    descriptor = descriptor.downcase

    if @descriptors.keys.include?(descriptor)
      weekdays[@descriptors[descriptor.downcase]]
    else
      weekdays.select { |day| day.day.between?(13, 19) }.first
    end
  end
end



