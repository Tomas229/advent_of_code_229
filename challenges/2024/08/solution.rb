# frozen_string_literal: true

module Year2024
  # Solution
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      my_setup
      @anti_nodes = []
      @antennas.each_value do |v|
        v.combination(2).each do |a, b|
          add_anti_node(a, b)
          add_anti_node(b, a)
        end
      end
      @anti_nodes.size
    end

    def part_2
      nil
    end

    private

    def my_setup
      setup_matrix
      setup_antennas_dict
    end

    def setup_matrix
      @matrix = Matrix.new(data.map(&:chars))
    end

    def setup_antennas_dict
      @antennas = {}
      @matrix.each_coord do |x, y|
        value = @matrix.coord(x, y)
        @antennas[value] = (@antennas[value] || []).push([x, y]) if value != '.'
      end
    end

    def sum_points(point_1, point_2)
      [point_1[0] + point_2[0], point_1[1] + point_2[1]]
    end

    def sus_points(point_1, point_2)
      [point_1[0] - point_2[0], point_1[1] - point_2[1]]
    end

    def add_anti_node(point_1, point_2)
      new_point = sum_points(point_1, sus_points(point_1, point_2))
      @anti_nodes.push(new_point) unless @anti_nodes.include?(new_point) || @matrix.coord(*new_point).nil?
    end
  end
end
