# frozen_string_literal: true

module Year2024
  # Solution
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      left = []
      right = []
      data.each do |d|
        l, r = d.split
        left += [l.to_i]
        right += [r.to_i]
      end
      left.sort!
      right.sort!

      distance = left.zip(right).map { |x| x.reduce(:-).abs }
      distance.reduce(:+)
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
  end
end
