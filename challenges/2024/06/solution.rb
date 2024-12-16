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
      move_guardian(setup_grid)
    end

    def part_2
      sum = 0
      original_path = setup_grid
      move_guardian(original_path)
      original_path.each_coord do |x, y|
        next unless original_path.check_cell(x, y)&.value == 'X'

        new_grid = setup_grid
        new_grid.change_value(x, y, '#')
        sum += find_loop(new_grid) ? 1 : 0
      end
      sum
    end

    private

    def move_guardian(grid)
      sum = 1
      direction = :UP
      while (next_value = grid.check_cell(*next_coords(grid.pointer, direction))&.value)
        while next_value == '#'
          direction = turn_direction(direction)
          next_value = grid.check_cell(*next_coords(grid.pointer, direction))&.value
        end
        sum += take_step(grid, *next_coords(grid.pointer, direction))
      end
      sum
    end

    def find_loop(grid)
      direction = :UP
      while (next_value = grid.check_cell(*next_coords(grid.pointer, direction))&.value)
        while next_value == '#'
          direction = turn_direction(direction)
          next_value = grid.check_cell(*next_coords(grid.pointer, direction))&.value
        end
        loop_start = take_step_loop(grid, *next_coords(grid.pointer, direction), direction, loop_start)
        return true if loop_start == true
      end
      false
    end

    def turn_direction(direction)
      TURN_DICT[direction]
    end

    def next_coords(pos_array, direction)
      STEP_DICT[direction].zip(pos_array).map(&:sum)
    end

    def take_step(grid, x_coord, y_coord)
      new_value = grid.move_pointer(x_coord, y_coord)&.value
      if new_value == '.'
        grid.change_value(x_coord, y_coord, 'X')
        return 1
      end
      0
    end

    def take_step_loop(grid, x_coord, y_coord, direction, loop_start)
      new_value = grid.move_pointer(x_coord, y_coord)&.value
      if new_value == '.'
        grid.change_value(x_coord, y_coord, 'X')
        []
      elsif !loop_start || loop_start.empty?
        [x_coord, y_coord, direction]
      else
        loop_start == [x_coord, y_coord, direction] ? true : loop_start
      end
    end

    def setup_grid
      guard = [0, 0]
      data.each_with_index do |d, i|
        if d.index('^')
          guard = [d.index('^'), i]
          break
        end
      end
      Grid.new(data.map(&:chars), pointer: guard)
    end
  end
end
