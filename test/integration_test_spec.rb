require_relative '../lib/complete_me'

RSpec.describe CompleteMe do
  describe 'all methods' do
    it 'counts the correct words after populating overlapping words' do
      cm = CompleteMe.new
      cm.populate(['this', 'that', 'the', 'they'])

      expect(cm.count).to eq(4)
    end
    it 'counts the correct words after inserting overlapping words' do
      cm = CompleteMe.new
      cm.insert('this')
      cm.insert('that')
      cm.insert('the')
      cm.insert('they')

      expect(cm.count).to eq(4)
    end
  end
end

