require_relative '../lib/complete_me'

RSpec.describe CompleteMe do 
  describe 'insert' do
    it 'responds to the method insert' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:insert)
    end

    it 'inserts a word into the dictionary' do
      cm = CompleteMe.new

      expect{cm.insert('pizza')}.to change{cm.count}.from(0).to(1)
    end
  end


end