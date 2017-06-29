require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'suggest method' do
    it 'responds to the suggest method' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:suggest)
    end

    xit 'suggest a word when that word is the only word in the dictionary' do
      cm = CompleteMe.new
      cm.insert('pizza')

      expect(cm.suggest('piz')).to eq(['pizza'])
    end

    xit 'suggest two word that have overlapping letters' do
      cm = CompleteMe.new
      cm.insert('dot')
      cm.insert('dog')

      expect(cm.suggest('do')).to eq(['dot', 'dog'])
    end
  end
end