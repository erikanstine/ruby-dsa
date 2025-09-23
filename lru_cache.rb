# typed: true
# frozen_string_literal: true

# Double linked list node for LRU list.
class Node
  attr_accessor :next, :prev, :key, :val

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
  end
end

# Simple LRU Cache implementation using hash and doubly linked list.
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @nodemap = {} # {key: Node}
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def print_nodes
    cur = @head.next
    while cur && cur != @tail
      puts "#{cur.key}, #{cur.val}"
      cur = cur.next
    end
  end

  def insert(key, value)
    puts "Inserting node #{key}, #{value}"
    n = Node.new(key, value)
    t = @head.next
    @head.next = n
    t.prev = n
    n.next = t
    n.prev = @head
    @nodemap[key] = n

    return unless @nodemap.size > @capacity

    delete(@tail.prev.key)
  end

  def delete(key)
    n = @nodemap[key]
    n.prev.next = n.next
    n.next.prev = n.prev
    @nodemap.delete(key)
  end

  def get(key)
    return unless @nodemap.key?(key)

    t = @nodemap[key]
    # move node to head
    delete(key)
    insert(key, t.val)

    # return value
    @nodemap[key].val
  end

  def set(key, value)
    delete(key) if @nodemap.key?(key)
    insert(key, value)
  end
end
