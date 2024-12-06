# frozen_string_literal: true

module Year2024
  # Solution
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      parse_input
      @manuals.select { |manual| manual == order_manual(manual) }.sum { |manual| calc_middle_value(manual) }
    end

    def part_2
      parse_input
      sum = 0
      @manuals.each do |manual|
        ordered_manual = order_manual(manual)
        sum += calc_middle_value(ordered_manual) if manual != ordered_manual
      end
      sum
    end

    private

    def calc_middle_value(manual)
      manual[(manual.size - 1) / 2].to_i
    end

    def parse_input
      i = data.find_index('')
      @manuals = data[i + 1..].map { |m| m.split(',') }
      @rules = {}
      data[0...i].each do |line|
        a, b = line.split('|')
        @rules[a] = (@rules[a] || []).push(b)
      end
    end

    def order_manual(manual)
      manual.sort { |x, y| @rules[x]&.include?(y) ? -1 : 1 }
    end
  end
end
