require_relative '../lib/complete_me_2' 

RSpec.describe CompleteMe do
  it 'complete me class exists' do
    cm = CompleteMe.new

    expect(cm).to be_kind_of(CompleteMe)
  end
  
  context 'unit method tests' do

    let(:cm) { CompleteMe.new }

    describe '#insert' do
      it 'responds to method' do 
        result = cm.insert('a')

        expect(result).to eq('a')
      end

      it 'does not increase count if the same word is added' do
        cm.insert('a')
        cm.insert('a')

        expect(cm.count).to eq(1)
      end

    end
    
    describe '#suggest' do
      it 'responds to suggest' do 
        cm.insert('to')
        
        expect(cm.suggest('t')).to eq(['to'])
      end
    end

    describe '#count' do
      it 'responds to count' do 
        cm.insert('a')


        expect(cm.count).to eq(1)
      end

      it 'counts multiple things' do
        cm.insert('a')
        cm.insert('b')

        expect(cm.count).to eq(2)
      end
    end
    
    describe '#populate' do
      context 'return value' do
        it 'returns nuber of words inserted' do
          arr = ['a', 'b']
          result = cm.populate(arr)

          expect(result).to eq(2)
        end

        it 'doesnt insert duplicates' do
          arr = ['a', 'a']
          result = cm.populate(arr)

          expect(result).to eq(1)
        end
      end

      it 'increases the count' do
        cm.populate(['b', 'c'])

        expect(cm.count).to eq(2)
      end

      it 'does not count duplicates' do
        cm.populate(['a', 'a'])

        expect(cm.count).to eq(1)
      end
    end
  end
end

