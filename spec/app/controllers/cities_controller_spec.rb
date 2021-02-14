describe CitiesController do
  describe '#show' do
    it 'show the city details' do
      expect(described_class.new({ id: 1100015}).show).to eq('Alta Floresta dOeste')
    end
  end

  describe '#index' do
    it 'list the cities' do
      expect(subject.index).to eq(['Alta Floresta dOeste', 'Ariquemes'])
    end
  end

  describe '#ranking_general_city' do
    it 'list ranking names by City' do
      expect(subject.ranking_general_city).to eq(['MARIA', 'JOSE', 'JOAO'])
    end
  end

  describe '#ranking_genre_city' do
    it 'list ranking by genre female city' do
      expect(subject.city_by_female).to eq(['MARIA', 'ANA'])
    end

    it 'list ranking by genre male city' do
      expect(subject.city_by_male).to eq(['JOSE', 'JOAO'])
    end
  end
end