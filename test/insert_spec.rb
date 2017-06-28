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

    xit 'inserts words that use the same starting letters as children of the letter' do
      cm = CompleteMe.new
      cm.insert('dog')
      cm.insert('dot')
      children = cm.dic.next.next.map do |letter|
        letter.val
      end

      expect(cm.dic.length).to eq(1)
      expect(cm.dic.next.length).to eq(1)
      expect(cm.dic.next.next.length).to eq(2) 
      expect(children).to eq(['g', 't'])
    end
  end


end