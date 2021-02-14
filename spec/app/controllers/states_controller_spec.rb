describe StatesController do
  describe '#show' do
    it 'show the state details' do
      expect(described_class.new({ id: 11 }).show).to eq('MS')
    end
  end

  describe '#index' do
    it 'list the states' do
      expect(subject.index).to eq(%w[FS SS])
    end
  end

  describe '#ranking_general_state' do
    it 'list ranking names by State' do
      expect(subject.ranking_general_state).to eq(%w[MARIA JOSE])
    end
  end

  describe '#ranking_genre_state' do
    it 'list ranking by genre female state' do
      expect(subject.state_by_female).to eq(%w[MARIA ANA])
    end

    it 'list ranking by genre male state' do
      expect(subject.state_by_male).to eq(%w[JOSE JOAO])
    end
  end
end
