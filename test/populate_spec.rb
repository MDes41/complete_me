require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'populate method' do
    it 'responds to the method' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:populate)
    end

    it 'populates two words into the dictionary' do
      cm = CompleteMe.new
      words = ['pizza', 'cheese']
      cm.populate(words)

      expect(cm.count).to eq(2)
    end
  end
end
