# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day08 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/08/input.txt')) }
  let(:example_input) do
    <<~EOF
      ............
      ........0...
      .....0......
      .......0....
      ....0.......
      ......A.....
      ............
      ............
      ........A...
      .........A..
      ............
      ............
    EOF
  end

  describe 'part 1' do
    it 'returns 14 for the example input' do
      expect(described_class.part_1(example_input)).to eq(14)
    end

    it 'returns 376 for my input' do
      expect(described_class.part_1(input)).to eq(376)
    end
  end

  describe 'part 2' do
    it 'returns 34 for the example input' do
      expect(described_class.part_2(example_input)).to eq(34)
    end

    it 'returns 1352 for my input' do
      expect(described_class.part_2(input)).to eq(1352)
    end
  end
end
