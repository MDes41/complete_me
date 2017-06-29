require_relative '../lib/complete_me'

RSpec.describe CompleteMe do 
  describe 'insert' do
    it 'responds to the method insert' do
      cm = CompleteMe.new

      expect(cm).to respond_to(:insert)
    end

    it 'inserts a word into the dictionary' do
      cm = CompleteMe.new
      cm.insert('pizza')

      expect(cm.count).to eq(1)
    end

    it 'inserts words that use the same starting letters as children of the letter' do
      cm = CompleteMe.new
      cm.insert('dog')
      cm.insert('dot')
      children = cm.dictionary.children.first.children.first.children.map do |letter|
        letter.val
      end

      expect(cm.dictionary.children.length).to eq(1)
      expect(cm.dictionary.children.first.children.length).to eq(1)
      expect(cm.dictionary.children.first.children.first.children.length).to eq(2) 
      expect(children).to eq(['g', 't'])
    end
  end


end