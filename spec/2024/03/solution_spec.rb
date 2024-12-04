# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    EOF
  end

  describe 'part 1' do
    it 'returns 161 for the example input' do
      expect(described_class.part_1(example_input)).to eq(161)
    end

    it 'returns 173517243 for my input' do
      expect(described_class.part_1(input)).to eq(173_517_243)
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
