# frozen_string_literal: true

require 'matrix' unless defined?(Matrix)
module Year2024
  # Solution
  class Day13 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      tokens = 0
      index = 0
      while index < data.size
        tokens += token_calculator(data, index)
        index += 4
      end
      tokens
    end

    def part_2
      nil
    end

    private

    def token_calculator(data, index)
      coefficients = coefficients_matrix_creator(data, index)
      return 0 if coefficients.determinant.zero?

      res = sol_calculator(data, index, coefficients)
      a = res.element(0, 0)
      b = res.element(1, 0)
      return 0 if a.denominator != 1 && b.denominator != 1

      (3 * a.to_i) + b.to_i
    end

    def coefficients_matrix_creator(data, index)
      eq_1 = data[index].scan(/\d+/)
      eq_2 = data[index + 1].scan(/\d+/)
      Matrix[[eq_1[0].to_i, eq_2[0].to_i], [eq_1[1].to_i, eq_2[1].to_i]]
    end

    def sol_calculator(data, index, coefficients)
      eq_3 = data[index + 2].scan(/\d+/)
      coefficients.inverse * Matrix[[eq_3[0].to_i], [eq_3[1].to_i]]
    end
  end
end
