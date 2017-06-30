require_relative './node'

class CompleteMe
    attr_reader :dictionary

  def initialize
    @dictionary = Node.new(nil)
    @word = []
  end

  def letter_search(letter, nodes)
    node = nodes.find { |node| node.val == letter}
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

  def add_letters(starting_point)
    if starting_point.children == []
      @word << starting_point
      starting_point.leaf = true
    else
      starting_point.children.each do |next_letter|
        @word << starting_point
        add_letters(next_letter)
      end
    end
    @word
  end

  def count
    find_word_combos(@dictionary).count
  end

  def find_word_combos(starting_point)
    words = ''
    all_words = []
    add_letters(starting_point).each do |letter|
      words << letter.val if letter.val != nil
      all_words << words if letter.leaf == true  
    end
    return 0 if all_words.first == ''
    all_words
  end

  def suggest(suggestion)
    starting_word = ''
    current = @dictionary
    suggestion.chars.each do |letter|
      current.children.each do |starting_letter|
        if letter == starting_letter.val 
          starting_word += starting_letter.val
          current = starting_letter
        end
      end
    end
    find_word_combos(current).map.with_index do |ending| 
      starting_word + ending
    end
  end

end

