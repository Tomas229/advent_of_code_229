# frozen_string_literal: true

module Year2024
  # Solution
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
      array = parse_filesystem_2

      reverse_index = array.size
      while (reverse_index -= 1).positive?
        next unless (item = array[reverse_index])[:type] == :data

        reverse_index += search_memory(array, reverse_index, item)
      end
      check_sum_2(array)
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

    def check_sum_2(array)
      sum = 0
      index = -1
      array.each do |c|
        new_index = index + c[:quantity]
        sum += c[:data_index] * ((((new_index + 1) * new_index) / 2) - (((index + 1) * index) / 2)) if c[:type] == :data
        index = new_index
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

    def parse_filesystem_2
      array = []
      data.chars.each_with_index do |num, index|
        array += if index.even?
                   [{ type: :data, quantity: num.to_i, data_index: index / 2 }]
                 else
                   [{ type: :space, quantity: num.to_i }]
                 end
      end
      array
    end

    def search_memory(array, reverse_index, item)
      array.each_with_index do |space, i|
        break if i > reverse_index
        next unless space[:type] == :space && (delta = space[:quantity] - item[:quantity]) > -1

        move_file(array, delta, i, reverse_index)
        return delta.positive? ? 1 : 0
      end
      0
    end

    def move_file(array, delta, space_index, file_index)
      space = array[space_index]
      file = array[file_index]
      if delta.positive?
        space[:quantity] = delta
        array[file_index] = { type: :space, quantity: file[:quantity] }
        array.insert(space_index, file)
      else
        array[space_index] = file
        array[file_index] = space
      end
    end
  end
end
