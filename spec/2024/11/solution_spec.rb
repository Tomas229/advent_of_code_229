# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day11 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/11/input.txt')) }
  let(:example_input) do
    <<~EOF
      125 17
    EOF
  end

  describe 'part 1' do
    it 'returns 55312 for the example input' do
      expect(described_class.part_1(example_input)).to eq(55_312)
    end

    it 'returns 189547 for my input' do
      expect(described_class.part_1(input)).to eq(189_547)
    end
  end

  describe 'part 2' do
    it 'returns 65601038650482 for the example input' do
      expect(described_class.part_2(example_input)).to eq(65_601_038_650_482)
    end

    it 'returns 224577979481346 for my input' do
      expect(described_class.part_2(input)).to eq(224_577_979_481_346)
    end
  end
end
