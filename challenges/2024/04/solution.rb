# frozen_string_literal: true

module Year2024
  # Solution
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      sum = 0
      m = Matrix.new(data.map(&:chars))
      m.y.times do |y|
        m.x.times do |x|
          sum += find_xmas(m, x, y) if m.coord(x, y) == 'X'
        end
      end
      sum
    end

    def part_2
      sum = 0
      m = Matrix.new(data.map(&:chars))
      m.y.times do |y|
        m.x.times do |x|
          sum += find_x_mas(m, x, y) if m.coord(x, y) == 'A'
        end
      end
      sum
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end

    def find_xmas(matrix, x_coord, y_coord)
      count = 0
      [-1, 1, 0].repeated_permutation(2).to_a.reject { |e| e == [0, 0] }.each do |coord|
        count += find_in_line(matrix, x_coord, y_coord, *coord)
      end
      count
    end

    def find_in_line(matrix, x_coord, y_coord, dx_coord, dy_coord)
      'XMAS'.chars.each_with_index do |c, i|
        return 0 if matrix.coord(x_coord + (i * dx_coord), y_coord + (i * dy_coord)) != c
      end
      1
    end

    def find_x_mas(matrix, x_coord, y_coord)
      word_1 = [matrix.coord(x_coord - 1, y_coord + 1) || '', matrix.coord(x_coord + 1, y_coord - 1) || ''].sort
      word_2 = [matrix.coord(x_coord + 1, y_coord + 1) || '', matrix.coord(x_coord - 1, y_coord - 1) || ''].sort
      word_1 == word_2 && word_1 == %w[M S] ? 1 : 0
    end
  end
end
