require_relative './node'

class CompleteMe
    attr_reader :dic

  def initialize
    @dictionary = Node.new(nil)
  end

  def letter_search(letter, nodes)
    node = nodes.find { |node| node.val == letter}
    # node == nil ? Node.new(letter, []) : node
  end


  def insert(word)
    level = @dictionary.children
    word.chars.each do |letter|
      node = letter_search(letter, level)
      if node
        level = node.children
      else
        new_node = Node.new(letter, [])
        level << new_node
        level = new_node.children
      end
    end
  end

  def populate(word_list)
    word_list.each do |word|
      insert(word)
    end
  end

  def add_letters(starting_letter)
    word = []
    if starting_letter.children == []
      word << starting_letter.val
    else
      starting_letter.children.map do |next_letter|
        word << starting_letter.val + next_letter.val
      require 'pry';binding.pry
        add_letters(next_letter)
      end
    end
    word
  end

  def count
    word = []
    all_words = []
    @dictionary.children.each do |starting_letter|
      word << add_letters(starting_letter)
    end
    # require 'pry';binding.pry
      
  end

  def suggest(suggestion)
    word = []
    all_words = []
    suggestion.chars.each do |letter|
      @dictionary.each do |starting_letter|
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

