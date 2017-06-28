require_relative './node'

class CompleteMe
    attr_reader :dic

  def initialize
    @dic = [] 
    @home = Node.new(nil, nil)
  end

  def letter_search(letter, nodes)
    node = nodes.find { |node| node.val == letter}
    node == nil ? Node.new(letter, nil) : node
  end

  def insert(word)
    word.chars.each do |letter|
      insert_letter(letter)
    end
  end

  #insert word needs to search the first letter of the word to get a starting letter
  #then moves to the next array of letters and either finds or creates and moves on the the next letter



  def insert_letter(letter)
    current = letter_search(letter, @dic)
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(nil, nil)
    end
    @dic << @home
  end

  def populate(word_list)
    word_list.each do |word|
      insert(word)
    end
  end

  def count
    word = []
    all_words = []
    @dic.each do |starting_letter|
      current = starting_letter
      while current.next != nil
        word << current.val
        current = current.next
      end
      all_words << word.join
    end
    all_words.length
  end

  def suggest(suggestion)
    word = []
    all_words = []
    suggestion.chars.each do |letter|
      @dic.each do |starting_letter|
        if letter == starting_letter.val 
          current = starting_letter
          while current.next != nil
            word << current.val
            current = current.next
          end
          all_words << word.join
        end
      end
    end
    all_words
  end

  private
end

