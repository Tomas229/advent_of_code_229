# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day23 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2024/23/input.txt')) }
  let(:example_input) do
    <<~EOF
      kh-tc
      qp-kh
      de-cg
      ka-co
      yn-aq
      qp-ub
      cg-tb
      vc-aq
      tb-ka
      wh-tc
      yn-cg
      kh-ub
      ta-co
      de-co
      tc-td
      tb-wq
      wh-td
      ta-ka
      td-qp
      aq-cg
      wq-ub
      ub-vc
      de-ta
      wq-aq
      wq-vc
      wh-yn
      ka-de
      kh-ta
      co-tc
      wh-qp
      tb-vc
      td-yn
    EOF
  end

  describe 'part 1' do
    it 'returns 7 for the example input' do
      expect(described_class.part_1(example_input)).to eq(7)
    end

    it 'returns 1485 for my input' do
      expect(described_class.part_1(input)).to eq(1485)
    end
  end

  describe 'part 2' do
    it 'returns "co,de,ka,ta" for the example input' do
      expect(described_class.part_2(example_input)).to eq('co,de,ka,ta')
    end

    it 'returns "cc,dz,ea,hj,if,it,kf,qo,sk,ug,ut,uv,wh" for my input' do
      expect(described_class.part_2(input)).to eq('cc,dz,ea,hj,if,it,kf,qo,sk,ug,ut,uv,wh')
    end
  end
end
