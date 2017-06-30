require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'count' do
    xit 'responds to the method count' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:count)
    end

    xit 'starts with 0 words in the dictionary' do
      cm = CompleteMe.new

      expect(cm.count).to eq(0)
    end

    xit 'increases by 1 when you insert a word' do
      cm = CompleteMe.new
      cm.insert('pizza')

      expect(cm.count).to eq(1)
    end

    it 'counts words that overlap' do
      cm = CompleteMe.new
      cm.insert('do')
      cm.insert('doing')

      expect(cm.count).to eq(2)
    end
  end
end
