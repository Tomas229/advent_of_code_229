# frozen_string_literal: true

module Year2024
  # Solution
  class Day11 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      sum = 0
      data.split.each do |n|
        sum += stone_division(n, 25).size
      end
      sum
    end

    def part_2
      rocks = PopulationGrowthSimulator.new(data.split)
      rocks.iterate(75) { |element, quality| rock_rules(element, quality) }
      rocks.total
    end

    private

    def stone_division(number, blinks)
      return [number] if blinks < 1

      if number == '0'
        divide_zero_rock(blinks)
      elsif number.size.even?
        divide_even_rock(number, blinks)
      else
        divide_odd_rock(number, blinks)
      end
    end

    def divide_zero_rock(blinks)
      stone_division('1', blinks - 1)
    end

    def divide_even_rock(number, blinks)
      half = number.size / 2
      stone_division(number[...half].to_i.to_s, blinks - 1) + stone_division(number[half..].to_i.to_s, blinks - 1)
    end

    def divide_odd_rock(number, blinks)
      stone_division((number.to_i * 2024).to_s, blinks - 1)
    end

    def rock_rules(element, quantity)
      if element == '0'
        { '1' => quantity }
      elsif element.size.even?
        handle_even_case(element, quantity)
      else
        { (element.to_i * 2024).to_s => quantity }
      end
    end

    def handle_even_case(element, quantity)
      half = element.size / 2
      { element[...half].to_i.to_s => quantity }.merge(
        { element[half..].to_i.to_s => quantity }
      ) { |_key, val_1, val_2| val_1 + val_2 }
    end
  end
end
