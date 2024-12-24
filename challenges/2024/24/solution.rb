# frozen_string_literal: true

module Year2024
  # Solution
  class Day24 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      @instructions.each do |instruction|
        operand_1 = instruction[0]
        operand_2 = instruction[2]

        if @memory[operand_1].nil? || @memory[operand_2].nil?
          @instructions << instruction.dup
        else
          update_memory(operand_1, operand_2, instruction[1], instruction[3])
        end
      end
      memory_to_number(@memory)
    end

    def part_2
      nil
    end

    def setup_data
      i = data.find_index('')
      setup_memory(data[0...i])
      setup_instructions(data[i + 1..])
    end

    private

    def setup_memory(memory_data)
      @memory = {}
      memory_data.each do |line|
        wire = line.split(':')
        @memory[wire[0]] = !wire[1].to_i.zero?
      end
    end

    def setup_instructions(instructions_data)
      @instructions = instructions_data.map do |line|
        instructions = line.split('->')
        inputs = instructions[0].split
        [inputs[0], inputs[1], inputs[2], instructions[1].strip]
      end
    end

    def memory_to_number(memory_data)
      keys = memory_data.keys.select { |key| key.start_with? 'z' }.sort.reverse
      num = ''
      keys.each do |key|
        num += memory_data[key] ? '1' : '0'
      end
      num.to_i(2)
    end

    def update_memory(operand_1, operand_2, operation, output)
      res = case operation
            when 'AND'
              @memory[operand_1] && @memory[operand_2]
            when 'OR'
              @memory[operand_1] || @memory[operand_2]
            else
              @memory[operand_1] ^ @memory[operand_2]
            end
      @memory[output] = res
    end
  end
end
