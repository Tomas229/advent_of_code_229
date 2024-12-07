# frozen_string_literal: true

# Matrix. An y-sized array of x-sized arrays representing a Matrix.
class Matrix
  attr_reader :x, :y, :pointer

  def initialize(matrix, pointer: [0, 0])
    @matrix = matrix
    @x = matrix[0].size
    @y = matrix.size
    @pointer = pointer
  end

  # @return [Boolean] if the matrix rows are all of the same size.
  def valid_matrix?
    @matrix.each do |row|
      return false if row.size != @x
    end
    true
  end

  # @return [Object, NilClass] returns the object saved at (x_coord, y_coord). Nil if is not a valid coordinate.
  def coord(x_coord, y_coord)
    return nil if x_coord.negative? || x_coord >= @x || y_coord.negative? || y_coord >= @y

    @matrix[y_coord][x_coord]
  end

  # Updates value saved at (x_coord, y_coord)
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @param [Object] value
  def change_value(x_coord, y_coord, value)
    @matrix[y_coord][x_coord] = value
  end

  # Updates pointer position to (x_coord, y_coord) if its a valid position.
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @return [Object, NilClass] returns the object saved at (x_coord, y_coord). Nil if is not a valid coordinate.
  def move_pointer(x_coord, y_coord)
    new_pos_value = coord(x_coord, y_coord)
    @pointer = [x_coord, y_coord] if new_pos_value
    new_pos_value
  end

  # Prints the whole matrix
  # @return [Matrix] self
  def print_matrix
    @matrix.each do |row|
      puts row.join
    end
  end
end
