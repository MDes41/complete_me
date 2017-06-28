require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'count' do
    it 'responds to the method count' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:count)
    end

    it 'starts with 0 words in the dictionary' do
      cm = CompleteMe.new

      expect(cm.count).to eq(0)
    end
  end
end
