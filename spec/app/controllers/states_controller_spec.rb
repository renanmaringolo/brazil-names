describe StatesController do
  describe '#show' do
    it 'show the state details' do
      expect(described_class.new({ id: 11}).show).to eq({
        body: '<h1>MS</h1>',
        status: 200
      })
    end
  end

  describe '#index' do
    it 'list the states' do
      expect(subject.index).to eq({
        body: '<ul><li>FS</li><li>SS</li></ul>',
        status: 200
      })
    end
  end
end