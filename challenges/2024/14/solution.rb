# frozen_string_literal: true

module Year2024
  # Solution
  class Day14 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      @x = data.size > 20 ? 101 : 11
      @y = data.size > 20 ? 103 : 7
      @quadrants = { '1': 0, '2': 0, '3': 0, '4': 0 }
      data.each do |line|
        take_step(line)
      end
      @quadrants.values.reduce(:*)
    end

    def part_2
      nil
    end

    private

    def take_step(line)
      x, y = obtain_position(line)
      x_bound = @x / 2
      y_bound = @y / 2
      update_quadrant_count(x, y, x_bound, y_bound) if x != x_bound && y != y_bound
      [x, y]
    end

    def obtain_position(line)
      nums = line.scan(/-?\d+/).map(&:to_i)
      [(nums[0] + (nums[2] * 100)) % @x, (nums[1] + (nums[3] * 100)) % @y]
    end

    def update_quadrant_count(x_coord, y_coord, x_bound, y_bound)
      quadrant = if x_coord < x_bound
                   y_coord < y_bound ? :'1' : :'4'
                 elsif x_coord > x_bound
                   y_coord < y_bound ? :'2' : :'3'
                 end
      @quadrants[quadrant] += 1 if quadrant
    end
  end
end
