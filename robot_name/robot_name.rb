=begin
------ P
Write a program that manages robot factory settings.


------ E
see robot_name_test.rb
------ D

------ A

------ C
=end
class Robot
  @@generated_names = []

  def initialize
    @current_name = nil
    @letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  end

  def name
    return @current_name if @current_name
    new_name = generate_name
    @current_name = @@generated_names.include?(new_name) ? name : new_name
    @@generated_names << @current_name
    @current_name
  end

  def reset
    @@generated_names.delete(@current_name)
    @current_name = nil
  end
  
  private

  def generate_name
    new_name = ''
    2.times { new_name << @letters[rand(25)]}
    3.times { new_name << rand(9).to_s }
    new_name
  end
end

Robot.new.name