# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# The no recursion method takes longer than the recursive version. So I had to disable rubocop metrics for now
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
      num = 0
      data.each do |d|
        a, b = d.split(':')
        a = a.to_i
        num += calc_2(a, b.split.map(&:to_i)) ? a : 0
      end
      num
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

    def calc_2(res, numbers)
      return false if numbers[0] > res

      return res == numbers[0] if numbers.size == 1

      value_sum = numbers[0] + numbers[1]
      value_mul = numbers[0] * numbers[1]
      value_concat = (numbers[0].to_s + numbers[1].to_s).to_i
      numbers = numbers[2..] || []
      calc_2(res, [value_sum] + numbers) || calc_2(res, [value_mul] + numbers) || calc_2(res, [value_concat] + numbers)
    end

    # Takes longer than calc_1
    def calc_3(res, numbers)
      %i[+ *].repeated_permutation(numbers.size - 1).each do |operators|
        sum = numbers[0]
        numbers[1..].each_with_index do |n, i|
          sum = sum.public_send(operators[i], n)
          break if sum > res
          return true if sum == res
        end
      end
      false
    end
  end
end
# rubocop:enable Metrics/AbcSize
