# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day09 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/09/input.txt')) }
  let(:example_input) do
    <<~EOF
      2333133121414131402
    EOF
  end

  describe 'part 1' do
    it 'returns 1928 for the example input' do
      expect(described_class.part_1(example_input)).to eq(1928)
    end

    it 'returns 6283170117911 for my input' do
      expect(described_class.part_1(input)).to eq(6_283_170_117_911)
    end
  end

  describe 'part 2' do
    it 'returns 2858 for the example input' do
      expect(described_class.part_2(example_input)).to eq(2858)
    end

    it 'returns 6307653242596 for my input' do
      expect(described_class.part_2(input)).to eq(6_307_653_242_596)
    end
  end
end
