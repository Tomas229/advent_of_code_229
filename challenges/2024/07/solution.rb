# frozen_string_literal: true

module Year2024
  # Solution
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      num = 0
      data.each do |d|
        a, b = d.split(':')
        a = a.to_i
        num += calc(a, b.split.map(&:to_i)) ? a : 0
      end
      num
    end

    def part_2
      nil
    end

    private

    def calc(res, numbers)
      return false if numbers[0] > res

      return res == numbers[0] if numbers.size == 1

      value_sum = numbers[0] + numbers[1]
      value_mul = numbers[0] * numbers[1]
      numbers = numbers[2..] || []
      calc(res, [value_sum] + numbers) || calc(res, [value_mul] + numbers)
    end
  end
end
