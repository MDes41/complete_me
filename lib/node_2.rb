class Node 
  attr_reader :word, :letter, :children

  def initialize(word)
    @word = word
    @letter = word[0]
    @children = []
  end

  def self.insert(word)        
    return if word == ''
    node = new(word)
    (node.children << insert(word[1..-1])).compact!
    node
  end

  def ==(arg)
    arg == letter
  end

  def suggest(fragment)
  # alphabe
  # [alphabet]
  # its own letter
  # t
  # the fragment
  # ""
  # children

    if fragment == ""
      children.map { |c| "#{letter}#{c.letter}" }
    end
  end

#[og][g][""]
# letter = d
# word = dog
# children = [Node.new(og)]

# Fastest solution (use a switch to determine whether to create a node or use one)
# #completeMe NodeContainer.find(d)
# if it has a node
# node.insert(og)
# else
# node_container << Node.insert(dog)
# #CompleteMe  => Node.insert(dog)

# Best solution (break container into own calss)
# CompleteMe NodeContainer.insert(dog)
# NodeContainer do I have one? add to it
# If I don't, make it and add to it.
# sets letter, creates child

end