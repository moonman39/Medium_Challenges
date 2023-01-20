=begin
------ P
Given a letter, output a diamond shape.

Given a letter, it prints a diamond starting with 'A'; with the supplied
letter at the widest point

Rules
Explicit:
- the first row contains one 'A'
- the last row contains one 'A'
- All rows, except the first and last, have exactly two identical letters
- the diamond is horizontally symmetric
- the diamond is vertically symmetric
- the diamond has a square shape (width equals height)
- the letters form a diamond shape 
- the top hald has the letters in ascending order
- the bottom half has the letters in descending order
- the four corners are trianges
------ E
see diamond_test.rb
------ D
class Diamond
  def initialize
    @letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    @step = 1
  end

  def make_diamond(letter)
    @index = letter.size / 2
  end
end
------ A
initialize
1. initialize @letters to a string containing the letters A through Z
2. initialize and assign @step to 1
------ C
=end
class Diamond
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  def self.make_diamond(letter)
    width = set_width(letter)
    half = width / 2

    first_half = (0..LETTERS.index(letter)).map do |i|
      string = ''.center(width)
      current_letter = LETTERS[i]
      string[half - i] = current_letter
      string[half + i] = current_letter
      string + "\n"
    end
    
    (first_half + first_half[0...-1].reverse).join
  end

  def self.set_width(letter)
    width = 1
    LETTERS.index(letter).times { width += 2 }
    width
  end
end


