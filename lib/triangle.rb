require 'pry'
class Triangle

  def initialize(a, b, c)
    @dimensions = []
    @dimensions << a << b << c
    @dimensions.sort!
  end

  def kind
    #Check if any is an invalid value, throw custom exception early
    raise TriangleError if @dimensions.any?{|side| side <= 0}
    # Check triangle inequality x <= a + b for all a, b
    # No need to go through every permutation, just sort and access lowest 2, and compare
    raise TriangleError if @dimensions.slice(0..1).sum <= @dimensions[2]

    case @dimensions.uniq.length
      when 1
        :equilateral
      when 2
        :isosceles
      when 3
        :scalene
    end
  end

  class TriangleError < StandardError
    # triangle error code
  end
end 