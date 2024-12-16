# frozen_string_literal: true

COORDS = { N: [0, -1], S: [0, 1], E: [1, 0], W: [-1, 0] }.freeze

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

  # @param [Object] x_coord
  # @param [Object] y_coord
  # @return [Boolean] If (x_coord, y_coord) is a valid coordinate on the Grid.
  def valid_coords?(x_coord, y_coord)
    !x_coord.negative? && x_coord < @x && !y_coord.negative? && y_coord < @y
  end

  # @param [Object] x_coord
  # @param [Object] y_coord
  # # @return [Grid::Cell, NilClass] returns Cell at (x_coord, y_coord). Nil if is not a valid coordinate.
  def check_cell(x_coord, y_coord)
    return nil unless valid_coords?(x_coord, y_coord)

    Cell.new(x_coord, y_coord, @grid[y_coord][x_coord])
  end

  # @return [Object, NilClass] returns the object saved at (x_coord, y_coord). Nil if is not a valid coordinate.
  def check_cell_value(x_coord, y_coord)
    check_cell(x_coord, y_coord)&.value
  end

  # Checks the cell at a cardinal direction from the pointer or from a point if given x_coord and y_coord
  # @param [Symbol] direction A cardinal direction used to check
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @return [Grid::Cell, nil] returns a Cell at the direction. Nil if is not a valid coordinate.
  def check_in_direction(direction, x_coord = nil, y_coord = nil)
    dx, dy = COORDS[direction]
    x_coord ||= pointer[0]
    y_coord ||= pointer[1]
    check_cell(x_coord + dx, y_coord + dy)
  end

  # Updates value saved at (x_coord, y_coord)
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @param [Object] value
  # @return [Grid::Cell, NilClass] Cell showing updated parameters or nil if coords were invalid
  def change_value(x_coord, y_coord, value)
    return nil unless valid_coords?(x_coord, y_coord)

    @grid[y_coord][x_coord] = value
    Cell.new(x_coord, y_coord, value)
  end

  # Updates pointer position to (x_coord, y_coord) if its a valid position.
  # @param [Integer] x_coord
  # @param [Integer] y_coord
  # @return [Grid::Cell,, NilClass] returns a Cell at (x_coord, y_coord). Nil if is not a valid coordinate.
  def move_pointer(x_coord, y_coord)
    new_pos_value = check_cell(x_coord, y_coord)
    @pointer = [x_coord, y_coord] if new_pos_value
    new_pos_value
  end

  # Moves the pointer at the provided direction.
  # @param [Symbol] direction
  # @return [Grid::Cell,, NilClass] returns a Cell at the direction. Nil if is not a valid coordinate.
  def move_pointer_in_direction(direction)
    new_cell = check_in_direction(direction)
    @pointer = [new_cell.x, new_cell.y] if new_cell
    new_cell
  end

  # Searches for an object in a specific direction. If a block is passed uses that to search.
  # @param [Symbol] direction
  # @param [Object, NilClass] value
  # @return [Grid::Cell, nil] returns a Cell with the object. Nil if it wasn't found.
  def search_in_direction(direction, value = nil)
    dx, dy = COORDS[direction]
    x_coord = pointer[0] + dx
    y_coord = pointer[1] + dy
    while (res = check_cell(x_coord, y_coord)) && block_given? ? !yield(res.value) : (res&.value != value)
      x_coord += dx
      y_coord += dy
    end
    res
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
