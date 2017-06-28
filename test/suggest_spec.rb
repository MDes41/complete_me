require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'suggest method' do
    it 'responds to the suggest method' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:suggest)
    end
  end
end