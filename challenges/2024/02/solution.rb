# frozen_string_literal: true

module Year2024
  # Solution
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      res = 0
      data.each do |report|
        report = report.split(' ').map(&:to_i)
        res += 1 if report_safe?(report)
      end
      res
    end

    def part_2
      nil
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

    def report_safe?(report)
      return false if report.sort != report && report.sort.reverse != report
      (report.size - 1).times do |i|
        diff = report[i] - report[i + 1]
        return false unless 1 <= diff.abs && diff.abs <= 3
      end
    end
  end
end
