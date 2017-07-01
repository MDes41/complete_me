require_relative './node_2'
require_relative './node_container'

class CompleteMe
  attr_reader :node_container

  def initialize
    @node_container = NodeContainer.new
  end

  def insert(word)
    return if exists?(word)
    n = Node.insert(word)
    node_container << n
    n.word
  end

  def count
    node_container.count
  end

  def populate(word_list)
    word_list.map { |word| insert(word) }.compact.count
  end

  def suggest(fragment)
    first_letter = fragment[0]
    suggestion   = fragment[1..-1]
    current_node(first_letter).suggest(suggestion)
  end


  private 

    def current_node(letter)
      node_container.current_node(letter)
    end

    def exists?(word)
     node_container.exists?(word)
    end
end