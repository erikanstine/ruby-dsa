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
  extend T::Sig

  sig { params(capacity: Integer).void }
  def initialize(capacity)
    @capacity = capacity
    @nodemap = {} # {key: Node}
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  sig { void }
  def print_nodes
    cur = @head.next
    while cur && cur != @tail
      puts "#{cur.key}, #{cur.val}"
      cur = cur.next
    end
  end

  sig { params(key: T.untyped, value: T.untyped).void }
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

  sig { params(key: T.untyped).void }
  def delete(key)
    n = @nodemap[key]
    n.prev.next = n.next
    n.next.prev = n.prev
    @nodemap.delete(key)
  end

  sig { params(key: T.untyped).returns(T.untyped) }
  def get(key)
    return unless @nodemap.key?(key)

    t = @nodemap[key]
    # move node to head
    delete(key)
    insert(key, t.val)

    # return value
    @nodemap[key].val
  end

  sig { params(key: T.untyped, value: T.untyped).void }
  def set(key, value)
    delete(key) if @nodemap.key?(key)
    insert(key, value)
  end
end
