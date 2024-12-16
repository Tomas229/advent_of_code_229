# frozen_string_literal: true

# Grid. An y-sized array of x-sized arrays representing a Grid.
class Grid
  attr_reader :x, :y, :pointer

  def initialize(grid, pointer: [0, 0])
    @grid = grid
    @x = grid[0].size
    @y = grid.size
    @pointer = pointer
  end

  # @return [Boolean] if the grid rows are all of the same size.
  def valid_grid?
    @grid.each do |row|
      return false if row.size != @x
    end
    true
  end

  # @return [Object, NilClass] returns the object saved at (x_coord, y_coord). Nil if is not a valid coordinate.
  def coord(x_coord, y_coord)
    return nil if x_coord.negative? || x_coord >= @x || y_coord.negative? || y_coord >= @y

    @grid[y_coord][x_coord]
  end

  # Updates value saved at (x_coord, y_coord)
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @param [Object] value
  def change_value(x_coord, y_coord, value)
    @grid[y_coord][x_coord] = value
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

  # Prints the whole grid
  # @return [Grid] self
  def print
    @grid.each do |row|
      puts row.join
    end
  end

  # Yields a block to every coord
  def each_coord
    @y.times do |row|
      @x.times do |col|
        yield(row, col)
      end
    end
  end

  # Representation of a cell on the grid.
  class Cell
    attr_reader :x, :y, :value

    def initialize(x_coord, y_coord, value)
      @x = x_coord
      @y = y_coord
      @value = value
    end
  end
end
