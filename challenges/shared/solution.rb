# frozen_string_literal: true

# Solution
class Solution
  def self.part_1(*input)
    new(*input).part_1
  end

  def self.part_2(*input)
    new(*input).part_2
  end

  def initialize(input)
    @input = input
    setup_data
  end

  def data
    @data ||= begin
      processed = @input.lines(chomp: true).map do |line|
        process_input line
      end

      processed.length == 1 ? processed.first : process_dataset(processed)
    end
  end

  def setup_data; end

  private

  def process_input(line)
    line
  end

  def process_dataset(set)
    set
  end
end
