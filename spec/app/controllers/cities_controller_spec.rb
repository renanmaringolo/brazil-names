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
end