# frozen_string_literal: true

module Year2024
  # Solution
  class Day10 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    COORDS = [[0, - 1], [0, 1], [- 1, 0], [1, 0]].freeze

    def part_1
      sum = 0
      @grid.each_coord do |x, y|
        sum += find_peak(x, y).uniq.size if @grid.coord(x, y).zero?
      end
      sum
    end

    def part_2
      nil
    end

    private

    def setup_data
      @grid = Grid.new(data.map(&:chars).map { |a| a.map(&:to_i) })
    end

    def find_peak(x_coords, y_coords)
      value = @grid.coord(x_coords, y_coords)
      return [[x_coords, y_coords]] if value == 9

      res = []
      COORDS.each do |coord|
        new_cords = coord.zip([x_coords, y_coords]).map(&:sum)
        res += find_peak(*new_cords) if @grid.coord(*new_cords)&.public_send(:-, value) == 1
      end
      res
    end
  end
end
