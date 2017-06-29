require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'letter search' do
    it 'responds to method' do 
      cm = CompleteMe.new

      expect(cm).to respond_to(:letter_search)
    end

    it 'responds with new node if it can not find the letter' do
      cm = CompleteMe.new
      cm.insert('dot')
      cm.insert('cat')
      result = cm.letter_search('z', cm.dictionary.children)

      expect(result).to eq(nil)
    end

    it 'returns the node when searching for that nodes val' do
      cm = CompleteMe.new
      node1 = Node.new('c', nil)
      node2 = Node.new('d', nil)
      nodes = [node1, node2]

      expect(cm.letter_search('d', nodes)).to eq(node2) 
    end
  end
end
