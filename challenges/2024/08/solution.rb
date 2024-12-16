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
      my_setup
      @anti_nodes = []
      @antennas.each_value do |v|
        v.combination(2).each do |a, b|
          add_resonant_anti_node(a, b)
          add_resonant_anti_node(b, a)
        end
      end
      @anti_nodes.size
    end

    private

    def my_setup
      setup_grid
      setup_antennas_dict
    end

    def setup_grid
      @grid = Grid.new(data.map(&:chars))
    end

    def setup_antennas_dict
      @antennas = {}
      @grid.each_coord do |x, y|
        value = @grid.check_cell(x, y)&.value
        @antennas[value] = (@antennas[value] || []).push([x, y]) if value != '.'
      end
    end

    def sum_points(point_1, point_2)
      [point_1[0] + point_2[0], point_1[1] + point_2[1]]
    end

    def sus_points(point_1, point_2)
      [point_1[0] - point_2[0], point_1[1] - point_2[1]]
    end

    def mult_point(point, num)
      [point[0] * num, point[1] * num]
    end

    def add_anti_node(point_1, point_2, mult = 1)
      delta = sus_points(point_1, point_2)
      new_point = sum_points(point_1, mult_point(delta, mult))
      inside_grid = @grid.check_cell(*new_point)&.value.nil?
      @anti_nodes.push(new_point) unless inside_grid || @anti_nodes.include?(new_point)
      !inside_grid
    end

    def add_resonant_anti_node(point_1, point_2)
      mult = 0
      mult += 1 while add_anti_node(point_1, point_2, mult)
    end
  end
end
