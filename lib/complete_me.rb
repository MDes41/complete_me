require_relative './node'

class CompleteMe

  def initialize
    @dic = [] 
    @home = Node.new(nil, nil)
  end

  def insert(word)
    current = @home
    word.chars do |letter|
      while current.next != nil
        current = current.next
      end
      current.val = letter
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
end

