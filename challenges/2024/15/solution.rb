# frozen_string_literal: true

module Year2024
  # Solution
  class Day15 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    COORDS = { '^': :N, v: :S, '>': :E, '<': :W }.freeze

    def part_1
      @instructions.each do |ins|
        ins.chars.map(&:to_sym).each do |ch|
          move_robot(COORDS[ch])
        end
      end
      count_boxes
    end

    def part_2
      nil
    end

    def setup_data
      blank = data.find_index('')
      setup_map(blank)
      @instructions = data[blank + 1..]
    end

    private

    def move_robot(direction)
      if (res = @map.check_in_direction(direction)).value == '.'
        @map.move_pointer_in_direction(direction)
      elsif res.value == 'O'
        move_boxes(direction, res)
      end
    end

    def move_boxes(direction, initial)
      cell = @map.search_in_direction(direction) { |value| value != 'O' }
      return unless !cell.nil? && cell.value == '.'

      @map.change_value(initial.x, initial.y, '.')
      @map.move_pointer_in_direction(direction)
      @map.change_value(cell.x, cell.y, 'O')
    end

    def count_boxes
      count = 0
      @map.each_coord do |x, y|
        count += (100 * y) + x if @map.check_cell(x, y).value == 'O'
      end
      count
    end

    def setup_map(blank)
      map = data[...blank]
      robot = nil
      map.each_with_index do |d, i|
        if (index = d.index('@'))
          robot = [index, i]
          break
        end
      end
      @map = Grid.new(map.map(&:chars), pointer: robot)
      @map.change_value(*robot, '.')
    end
  end
end
