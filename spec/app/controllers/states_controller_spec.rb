describe StatesController do
  describe '#show' do
    it 'show the state details' do
      expect(described_class.new({ id: 11}).show).to eq({
        body: '<h1>My State</h1>',
        status: 200
      })
    end
  end
end