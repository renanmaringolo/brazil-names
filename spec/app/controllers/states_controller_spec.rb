# frozen_string_literal: true

describe StatesController do
  describe '#show' do
    it 'show the state details' do
      state = StatesController.show(11)
      expect(state).to eq(11)
    end
  end

  describe '#index' do
    it 'list the states' do
      expect(StatesController.index.columns).to eq([[11, 12], %w[FS SS]])
    end
  end

  describe '#ranking_general_state' do
    it 'list ranking names by State' do
      rank = StatesController.ranking_general_state('SP')

      expect(rank.columns).to eq([%w[MARIA JOSE], [11_734_129, 5_754_529], [1, 2]])
    end
  end

  describe '#ranking_genre_state' do
    it 'list ranking by genre female state' do
      rank = StatesController.state_by_female('SP')

      expect(rank.columns.should).to eq([%w[MARIA ANA], [11_694_738, 3_079_729], [1, 2]])
    end

    it 'list ranking by genre male state' do
      rank = StatesController.state_by_male('SP')

      expect(rank.columns.should).to eq([%w[JOSE JOAO], [5_732_508, 2_971_935], [1, 2]])
    end
  end
end
