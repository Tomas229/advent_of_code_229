# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/02/input.txt')) }
  let(:example_input) do
    <<~EOF
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    EOF
  end

  describe 'part 1' do
    it 'returns 2 for the example input' do
      expect(described_class.part_1(example_input)).to eq(2)
    end

    it 'returns 686 for my input' do
      expect(described_class.part_1(input)).to eq(686)
    end
  end

  describe 'part 2' do
    it 'returns 4 for the example input' do
      expect(described_class.part_2(example_input)).to eq(4)
    end

    it 'returns 717 for my input' do
      expect(described_class.part_2(input)).to eq(717)
    end
  end
end
