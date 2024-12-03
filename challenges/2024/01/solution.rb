# frozen_string_literal: true

module Year2024
  # Solution
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      custom_process(data)
      distance = @left.zip(@right).map { |x| x.reduce(:-).abs }
      distance.reduce(:+)
    end

    def part_2
      custom_process(data)
      freq_hash = @right.group_by { |a| a }
      freq_hash.transform_values!(&:size)
      res = 0
      @left.each do |n|
        res += (freq_hash[n] || 0) * n
      end
      res
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
    def custom_process(data)
      @left = []
      @right = []
      data.each do |d|
        l, r = d.split
        @left += [l.to_i]
        @right += [r.to_i]
      end
      @left.sort!
      @right.sort!
    end
  end
end
