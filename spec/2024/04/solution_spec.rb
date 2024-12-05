# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/04/input.txt')) }
  let(:example_input) do
    <<~EOF
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
    EOF
  end

  describe 'part 1' do
    it 'returns 18 for the example input' do
      expect(described_class.part_1(example_input)).to eq(18)
    end

    it 'returns 2562 for my input' do
      expect(described_class.part_1(input)).to eq(2562)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input)).to eq(nil)
    end

    it 'returns nil for my input' do
      expect(described_class.part_2(input)).to eq(nil)
    end
  end
end
