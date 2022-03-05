class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end
    # adds a new node containing value to the end of the list
  def append(value)
    curr_node = @head
    while curr_node.next_node != nil
      curr_node = curr_node.next_node
    end
    curr_node.next_node = Node.new(value, nil)
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    return @head = Node.new(value) if @head.nil?

      curr_node = Node.new(value)
      curr_node.next_node = @head
      @head = curr_head
  end

  def size
    count = 0
    return count if @head.nil?

    count += 1
    curr_node = @head
    while (!curr_node.next_node.nil?)
      curr_node = curr_node.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    curr_node = @head
    return node if node.next.nil?

    while(!curr_node.next_node.nil?)
      curr_node = curr_node.next_node
    end
    curr_node
  end
end