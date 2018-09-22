require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  # Find empty leaf
  def insert(root, node)
    return root if root.rating === node.rating
    # Less than root
    if root.rating > node.rating
      if root.right.nil?
        root.right = node
        root.right.parent = root
      else
        insert(root.right, node)
      end
    # Greater than root
    elsif root.rating < node.rating
      if root.left.nil?
        root.left = node
        root.left.parent = root
      else
        insert(root.left, node)
      end
    else
      return "error, duplicate"
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data === nil
    return root if root.title === data

    left = find(root.left, data) if root.left != nil
    right = find(root.right, data) if root.right != nil

    if left != nil
      return left
    elsif right != nil
      return right
    else
      return nil
    end
  end

  # def find_next_slot(root, data)
  #   return nil if data === nil
  #   return root if root.title === data
    
  #   if root.left.nil?
  #     binding.pry
  #     return root.left
  #   elsif root.right.nil?
  #     return root.right
  #   else
  #     if object_has_children_slots(root.left)
  #       find_next_slot(root.left, data)
  #     else
  #       find_next_slot(root.right, data)
  #     end
  #   end

  # end

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

  def object_has_children_slots(node)
    return true if node.left.nil? || node.right.nil?
    return false
  end
end
