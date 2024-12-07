# frozen_string_literal: true

module Year2024
  # Solution
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    TURN_DICT = {
      UP: :RIGHT,
      DOWN: :LEFT,
      LEFT: :UP,
      RIGHT: :DOWN
    }.freeze

    STEP_DICT = {
      UP: [0, 0 - 1],
      DOWN: [0, 0 + 1],
      LEFT: [0 - 1, 0],
      RIGHT: [0 + 1, 0]
    }.freeze

    def part_1
      move_guardian(setup_matrix)
    end

    def part_2
      nil
    end

    private

    def move_guardian(matrix)
      sum = 1
      direction = :UP
      while (next_value = matrix.coord(*next_coords(matrix.pointer, direction)))
        while next_value == '#'
          direction = turn_direction(direction)
          next_value = matrix.coord(*next_coords(matrix.pointer, direction))
        end
        sum += take_step(matrix, *next_coords(matrix.pointer, direction))
      end
      sum
    end

    def turn_direction(direction)
      TURN_DICT[direction]
    end

    def next_coords(pos_array, direction)
      STEP_DICT[direction].zip(pos_array).map(&:sum)
    end

    def take_step(matrix, x_coord, y_coord)
      new_value = matrix.move_pointer(x_coord, y_coord)
      if new_value != 'X' && new_value != '^'
        matrix.change_value(x_coord, y_coord, 'X')
        return 1
      end
      0
    end

    def setup_matrix
      guard = [0, 0]
      data.each_with_index do |d, i|
        if d.index('^')
          guard = [d.index('^'), i]
          break
        end
      end
      Matrix.new(data.map(&:chars), pointer: guard)
    end
  end
end
