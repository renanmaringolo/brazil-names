# frozen_string_literal: true

describe CitiesController do
  describe '#show' do
    it 'show the city details' do
      expect(described_class.new({ id: 1_100_015 }).show).to eq('Alta Floresta dOeste')
    end
  end

  describe '#index' do
    it 'list the cities' do
      expect(subject.index.columns.should).to eq([[1_100_015, 1_100_023], ['Alta Floresta dOeste', 'Ariquemes']])
    end
  end

  describe '#ranking_general_city' do
    it 'list ranking names by City' do
      cities = CitiesController.new
      rank = cities.ranking_general_city('São Paulo')

      expect(rank.columns.should).to eq([%w[MARIA JOSE JOAO], [3592, 2008, 1292],
                                         [1, 2, 3]])
    end
  end

  describe '#ranking_genre_city' do
    it 'list ranking by genre female city' do
      cities = CitiesController.new
      rank = cities.city_by_female('São Paulo')

      expect(rank.columns.should).to eq([%w[MARIA ANA], [3581, 1116], [1, 2]])
    end

    it 'list ranking by genre male city' do
      cities = CitiesController.new
      rank = cities.city_by_male('São Paulo')

      expect(rank.columns.should).to eq([%w[JOSE JOAO], [1998, 1288], [1, 2]])
    end
  end
end
