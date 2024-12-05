# frozen_string_literal: true

# Matrix. An y-sized array of x-sized arrays representing a Matrix.
class Matrix
  attr_reader :x, :y

  def initialize(matrix)
    @matrix = matrix
    @x = matrix[0].size
    @y = matrix.size
  end

  # @return [Boolean] if the matrix rows are all of the same size.
  def valid_matrix?
    @matrix.each do |row|
      return false if row.size != @x
    end
    true
  end

  # @return [Object, NilClass] returns the object on saved on (x_coord, y_coord). Nil if is not a valid coordinate.
  def coord(x_coord, y_coord)
    return nil if x_coord.negative? || x_coord >= @x || y_coord.negative? || y_coord >= @y

    @matrix[y_coord][x_coord]
  end
end
