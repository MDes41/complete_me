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

  def count
    word = []
    all_words = []
    require 'pry';binding.pry
    @dictionary.children.each do |starting_letter|
      current = starting_letter
      while current.next != []
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

