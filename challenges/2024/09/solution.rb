# frozen_string_literal: true

module Year2024
  # SOlution
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      array = parse_filesystem

      array.each_with_index do |num, index|
        if num == '.'
          num = array.pop while num == '.'
          array[index] = num
        end
      end

      check_sum(array)
    end

    def part_2
      nil
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
    private

    def check_sum(array)
      sum = 0
      array.each_with_index do |c, i|
        sum += c * i
      end
      sum
    end

    def parse_filesystem
      array = []
      data.chars.each_with_index do |num, index|
        array += if index.even?
                   [index / 2] * num.to_i
                 else
                   ['.'] * num.to_i
                 end
      end
      array
    end
  end
end
