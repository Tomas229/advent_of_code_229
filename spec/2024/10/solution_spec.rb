# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day10 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/10/input.txt')) }
  let(:example_input) do
    <<~EOF
      89010123
      78121874
      87430965
      96549874
      45678903
      32019012
      01329801
      10456732
    EOF
  end

  describe 'part 1' do
    it 'returns 36 for the example input' do
      expect(described_class.part_1(example_input)).to eq(36)
    end

    it 'returns 548 for my input' do
      expect(described_class.part_1(input)).to eq(548)
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
