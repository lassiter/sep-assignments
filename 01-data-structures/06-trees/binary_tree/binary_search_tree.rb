require_relative 'node'
require "pry"

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  # Find empty leaf
  def insert(root, node)
    # If less than root left
    if node.rating < root.rating
      # If a leaf is available insert
      if root.left.nil?
        root.left = node
      # Recursively call insert if false
      else
        insert(root.left, node)
      end
    # If greater than or equal right
    else
      # If a leaf is available insert
      if root.right.nil?
        root.right = node
      # Recursively call insert if false
      else
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data === nil
    return root if root.title === data

    if root.left != nil
      if root.left === data
        return root.left
      else
        find(root.left, data)
      end
    elsif root.right != nil
      if root.right === data
        return root.left
      else
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    return nil if data === nil

    node = self.find(root,data)
    if node === nil
      return nil
    else
      node.title = nil
      node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
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
    end
    # Return Output
    puts output.join("\n")
    output = []
  end
end
