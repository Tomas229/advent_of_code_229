# frozen_string_literal: true

module Year2024
  # Solution
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      sum = 0
      parse_input.each do |line|
        sum += line.scan(/mul\(\d{1,3},\d{1,3}\)/)
                   .map { |m| m.scan(/\d{1,3}/) }.map { |m| m.map(&:to_i) }.map { |m| m.reduce(&:*) }.reduce(:+)
      end
      sum
    end

    def part_2
      sum = 0
      enabled = true
      parse_input.each do |line|
        line.scan(/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/).each do |ins|
          res, enabled = calculate_instruction(ins, enabled)
          sum += res
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
    def parse_input
      @input.split('\n')
    end

    def calculate_instruction(ins, enabled)
      case ins
      when /do\(\)/
        [0, true]
      when /don't\(\)/
        [0, false]
      else
        res = enabled ? ins.scan(/\d{1,3}/).map(&:to_i).reduce(&:*) : 0
        [res, enabled]
      end
    end
  end
end
