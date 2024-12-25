# frozen_string_literal: true

module Year2024
  # Solution
  class Day25 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      count = 0
      @keys.each_value do |key|
        @locks.each_value do |lock|
          count += compare_fit(key, lock)
        end
      end
      count
    end

    def part_2
      nil
    end

    def setup_data
      @keys = {}
      @locks = {}
      i = 0
      j = 7
      while j < data.size + 1
        data[i].start_with?('.') ? setup_key(i, j) : setup_lock(i, j)
        i += 8
        j += 8
      end
    end

    private

    def setup_key(lower_index, upper_index)
      key = [0] * 5
      data[lower_index...upper_index].each_with_index do |line, row|
        get_string_indexes(line, '#').each { |col| key[col] = [key[col], 6 - row].max }
      end
      @keys[lower_index] = key
    end

    def setup_lock(lower_index, upper_index)
      lock = [5] * 5
      data[lower_index...upper_index].each_with_index do |line, row|
        get_string_indexes(line, '.').each { |col| lock[col] = [lock[col], row - 1].min }
      end
      @locks[lower_index] = lock
    end

    def get_string_indexes(string, char)
      (0...string.length).find_all { |i| string[i, 1] == char }
    end

    def compare_fit(key, lock)
      5.times do |i|
        return 0 if key[i] + lock[i] > 5
      end
      1
    end
  end
end
