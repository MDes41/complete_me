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

  def suggest(word)
    node_dic = @dic.dub
    word.chars.each do |letter|
      node = node_dic.select do |node| 
        node == letter
      end
      if node == false
        #make a new node
      else
        node_dic = node
      end
    end
  end
end

class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end