require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'suggest method' do
    it 'responds to the suggest method' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:suggest)
    end

    it 'suggest a word when that word is the only word in the dictionary' do
      cm = CompleteMe.new
      cm.insert('pizza')

      expect(cm.suggest('piz')).to eq(['pizza'])
    end
  end
end