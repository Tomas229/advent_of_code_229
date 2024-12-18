# frozen_string_literal: true

module Year2024
  # Solution
  class Day17 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      instructions = data[4][9..].split(',')
      res = []
      while @pointer < instructions.size
        cal = calculate_operation(instructions[@pointer], instructions[@pointer + 1])
        res += [cal] unless cal.empty?
        @pointer += 2
      end
      res.join(',')
    end

    def part_2
      nil
    end

    def setup_data
      @memory = { A: data[0][/\d+/].to_i, B: data[1][/\d+/].to_i, C: data[2][/\d+/].to_i }
      @pointer = 0
    end

    private

    def calculate_operation(opcode, operant)
      case opcode
      when '0' then op_div(:A, operant)
      when '1' then op_xor(operant)
      when '2' then op_modulo(operant)
      when '3' then op_jump(operant)
      when '4' then op_xor
      when '5' then op_print(operant)
      else op_div(:C, operant) end
    end

    def combo_operand(operand)
      case operand
      when '4' then @memory[:A]
      when '5' then @memory[:B]
      when '6' then @memory[:C]
      else
        operand.to_i
      end
    end

    def literal_operand(operand)
      operand.to_i
    end

    def op_div(sym, operant)
      @memory[sym] = (@memory[:A] / (2**combo_operand(operant))).truncate
      ''
    end

    def op_xor(operant=nil)
      @memory[:B] = @memory[:B] ^ (operant.nil? ? @memory[:C] : literal_operand(operant))
      ''
    end

    def op_modulo(operant)
      @memory[:B] = combo_operand(operant) % 8
      ''
    end

    def op_jump(operant)
      @pointer = (literal_operand(operant) - 2) unless @memory[:A].zero?
      ''
    end

    def op_print(operant)
      (combo_operand(operant) % 8).to_s
    end
  end
end
