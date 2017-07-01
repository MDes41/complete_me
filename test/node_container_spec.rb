require_relative '../lib/node_container'
require_relative '../lib/node_2'

RSpec.describe NodeContainer do 
  describe 'initialize' do
    it 'creates an empty array' do
      nc = NodeContainer.new

      expect(nc).to be_kind_of(NodeContainer)
    end
  end

  context 'String' do
    describe '#<<' do
      it 'does not shovel in if not a node' do
        nc = NodeContainer.new
        result = nc << 'not_a_node'

        expect(result).to eq([])
      end

      it 'shovels in a node' do
        nc = NodeContainer.new
        n = Node.new('definitely a node')
        result = nc << n

        expect(result).to eq(nc)
        expect(nc.first).to eq(n)
      end
    end

    describe '#count' do
      it 'returns number in container' do
        nc = NodeContainer.new
        n = Node.new('definitely a node')
        result = nc << n

        expect(result.count).to eq(1)
      end
    end
  end

  context 'methods' do
    describe '#current_node' do
      it 'returns node if matching' do
        nc = NodeContainer.new
        n = Node.new('definitely_a_node')
        result = nc << n

        expect(result.current_node('d')).to eq(n)
      end
    end

    describe '#exists?' do
      it 'return false if does not exits' do
        nc = NodeContainer.new
        n = Node.new('definitely_a_node')
        result = nc << n

        expect(result.exists?('a_node')).to be false
      end

      it 'return true if does exits' do
        nc = NodeContainer.new
        n = Node.new('definitely_a_node')
        result = nc << n

        expect(result.exists?('definitely_a_node')).to be true
      end
    end
  end
end
