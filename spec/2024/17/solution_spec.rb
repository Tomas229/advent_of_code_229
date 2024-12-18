# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day17 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/17/input.txt')) }
  let(:example_input) do
    <<~EOF
      Register A: 729
      Register B: 0
      Register C: 0

      Program: 0,1,5,4,3,0
    EOF
  end

  describe 'part 1' do
    it 'returns 4,6,3,5,6,3,5,2,1,0 for the example input' do
      expect(described_class.part_1(example_input)).to eq('4,6,3,5,6,3,5,2,1,0')
    end

    it 'returns 3,7,1,7,2,1,0,6,3 for my input' do
      expect(described_class.part_1(input)).to eq('3,7,1,7,2,1,0,6,3')
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
