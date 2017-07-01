require_relative '../lib/node_2'

RSpec.describe Node do
  context 'node class' do
    describe 'initialize' do
      it 'takes and agrument' do
        n = Node.new('word')

        expect(n).to be_kind_of(Node)
      end

      it 'returns the word passed to node' do
        n = Node.new('word')

        expect(n.word).to eq('word') 
      end

      it 'returns correct letter for word' do
        n = Node.new('word')

        expect(n.letter).to eq('w')
      end
    end

    describe '.insert' do
      it 'takes a word and returns a node' do
        n = Node.insert('word')

        expect(n).to be_kind_of(Node)
      end

      it 'takes a single letter word and returns empty array for children' do
        n = Node.insert('a')
        expect(n.children.count).to eq(0)
      end

      it 'takes a word and creates children if necessary' do
        n = Node.insert('be')

        expect(n.children.count).to eq(1)
        expect(n.children.first.letter).to eq('e')
      end
    end

    describe 'equality' do
      it 'shallow equals based on letter' do
        n = Node.new('word')

        expect(n == 'w').to be true
      end
    end


    describe 'children' do 
      it 'returns empty array if no children' do
        n = Node.insert('word')

        expect(n.letter).to                                              eq('w')
        expect(n.children.first.letter).to                               eq('o')
        expect(n.children.first.children.first.letter).to                eq('r')
        expect(n.children.first.children.first.children.first.letter).to eq('d')
      end

      it 'returns children if children' do
      end
    end

    describe 'suggest' do
      it 'suggest children when empty string is passed' do
        n = Node.new('word')

        expect(n.suggest('')).to eq(n.children)
      end
    end
  end
end
