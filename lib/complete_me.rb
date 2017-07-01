require_relative './node'

class CompleteMe
    attr_reader :dictionary

  def initialize
    @dictionary = Node.new(nil)
    @words = []
  end

  def letter_search(letter, nodes)
    node = nodes.find { |node| node.val == letter}
  end


  def insert(word)
    total = word.chars.length
    level = @dictionary.children
    word.chars.each_with_index do |letter, index|
      node = letter_search(letter, level)
      if node
        node.leaf = true if index == (total - 1)
        level = node.children
      else
        new_node = Node.new(letter, [])
        new_node.leaf = true if index == (total - 1)
        level << new_node
        level = new_node.children
      end
    end
    # require 'pry';binding.pry
  end

  def populate(word_list)
    word_list.each do |word|
      insert(word)
    end
  end

  def add_letters(starting_point)
    if starting_point.children == []
      # @words << starting_point.val
    else
      starting_point.children.each do |next_letter|
        @words << next_letter
        add_letters(next_letter)
      end
    end
    @words
  end

  def count
    find_word_combos(@dictionary).count
  end

  def find_word_combos(starting_point)
    # require 'pry';binding.pry
    word = ''
    all_words = []
    add_letters(starting_point).each do |letter|
      word << letter.val if letter.val != nil
      if letter.leaf == true
        all_words << word 
        word = ''
      end
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
    # require 'pry';binding.pry
    find_word_combos(current).map do |ending| 
      starting_word + ending
    end
  end
end

