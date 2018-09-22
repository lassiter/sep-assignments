require_relative 'node'

class MinBinaryHeap
  attr_accessor :root

  def initialize(root)
    @root = root
    @root ? @queue = [@root] : @queue = []
    @size = @queue.size
  end

  # Find appropraite insertion and swap if needed
  def insert(root, node)
    if root.rating > node.rating
      swap_up(root, node)
      @root = node
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && !root.left.nil?
        root.right = node
        swap_sibilings(root, root.left, root.right) if root.right.rating < root.left.rating
      else
        if root.left.left.nil? || root.left.right.nil?
          insert(root.left, node)
        else
          root.right = insert(root.right, node)
        end
      end
      @root = root
    end
  end

  def swap_up(parent, child)
    root = child
    newborn = Node.new(parent.title, parent.rating)
    root.left = newborn
    root.right = parent.left
    insert(root, parent.right) unless parent.right.nil?
  end

  def swap_sibilings(parent, left_node, right_node)
    parent.left = right_node
    parent.right = left_node
    left_node = right_node
    right_node = left_node
  end

  # Recursive Depth First Search
  def find(node, data)
    return nil if data === nil || node === nil
    return node if node.title === data
    left = find(node.left, data) if node.left != nil
    right = find(node.right, data) if node.right != nil

    if left != nil
      return left
    elsif right != nil
      return right
    else
      return nil
    end
  end

  def find_parent(root, node, data)
    return nil if root === nil || node === nil
    return root if root === node || root.left === node || root.right === node
    left = find_parent(root.left, node, data) if root.left != nil
    right = find_parent(root.right, node, data) if root.right != nil
    if left != nil
      return left if left.left === node || left.right === node
    elsif right != nil
      return right if right.left === node || right.right === node
    else
      return nil
    end
  end

  def delete(root, data)
    return nil if data === nil
    node = find(root, data)
    parent = find_parent(root, node, data)
    grandparent = find_parent(root, parent, parent.title) if object_has_children(node)
    delete_end(parent, node) unless object_has_children(node)
    if object_has_children(node)
      if grandparent.left === parent
        if parent.left === node
          parent.left = node.left
          node.left = node.right
        else
          parent.right = node.left
          node.left = node.right
        end
      else
        if parent.left === node
          parent.left = node.left
          node.left = node.right
        else
          parent.right = node.left
          node.left = node.right
        end
      end
      node.title = nil
      node.rating = nil   
    end
  end

  def delete_end(parent, node)
    if parent.left = node
      node.title = nil
      node.rating = nil
      parent.left = nil
    else
      node.title = nil
      node.rating = nil
      parent.right = nil
    end
  end

  # Recursive Depth First Search
  def printf(children=nil)
    queue = [] 
    queue.push(@root) if children.nil?
    queue.push(children) if !children.nil?
    output = []
    output.push("#{@root.title}: #{@root.rating}")
    while queue.length > 0
      node = queue.shift
      if node.left != nil
        queue.push(node.left)
        output.push("#{node.left.title}: #{node.left.rating}")
      end
      if node.right != nil
        queue.push(node.right)
        output.push("#{node.right.title}: #{node.right.rating}")
      end
      # p output.join("\n")
    end

    # Return Output
    puts output.join("\n")
    output = []
  end

  def object_has_children(node)
    return true if node.left != nil || node.right != nil
    return false
  end
end