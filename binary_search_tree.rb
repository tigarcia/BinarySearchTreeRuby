require 'pry'



class BinarySearchTree
  attr_reader :size
  
  class Node
    attr_accessor :value, :left, :right
    def initialize(value, left=nil, right=nil)
      @value = value
      @left = left
      @right = right
    end
  end

  def initialize(values=[])
    @root = nil
    @size = 0
    if values.length > 0
      ## TODO: Add the values from the array to the tree
    end
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
      @size += 1
    else
      insert_internal(value, @root)
    end

    self
  end

  def to_s()
    print_internal(@root, 0)
  end

  def find(value)
    nodes = find_internal(value, @root)
    nodes.nil? ? nil : nodes[:node].value
  end

  def delete(value)
    nodes = find_internal(value, @root)
    if nodes.nil?
      nil
    else
      delete_internal(nodes[:node], nodes[:parent])
    end 
  end

  private
    def insert_internal(value, node)
      if value <= node.value 
        if node.left.nil?
          node.left = Node.new(value)
          @size += 1
        else
          insert_internal(value, node.left)
        end
      else
        if node.right.nil?
          node.right = Node.new(value)
          @size += 1
        else
          insert_internal(value, node.right)
        end
      end
    end

    def print_internal(node, tab_count)
      unless node.nil?
        tab_count.times {|n| print "     "}
        puts node.value
        tab_count.times {|n| print "     "}
        if node.left.nil?
          puts " left: nil"
        else
          puts " left:"
          print_internal(node.left, tab_count + 1)
        end

        tab_count.times {|n| print "     "}

        if node.right.nil?
          puts " right: nil"
        else
          puts " right:"
          print_internal(node.right, tab_count + 1)
        end
      end
    end

    def find_internal(value, node, parent=nil)
      if node.nil?
        nil
      elsif value == node.value
        {node: node, parent: parent}
      elsif value < node.value
        find_internal(value, node.left, node)
      else
        find_internal(value, node.right, node)
      end
    end

    def find_next(node)
      return nil if node.nil? or node.right.nil?
      parent = node
      next_node = node.right

      until next_node.left.nil?
        next_node = next_node.left
        parent = next_node
      end

      {node: next_node, parent: parent}
    end

    def delete_internal(node, parent)
      if node.nil?
        return nil
      elsif node.left.nil? and node.right.nil?
        if parent.nil?
          @root = nil
        else
          parent.left = nil if parent.left == node
          parent.right = nil if parent.right == node
        end
      elsif node.left.nil? or node.right.nil?
        subtree = node.left if node.right.nil?
        subtree = node.right if node.left.nil?
        if parent.nil?
          @root = subtree
        else
          parent.left = subtree if parent.left == node
          parent.right = subtree if parent.right == node
        end
      else
        nodes = find_next(node)
        nodes[:parent] = nil if nodes[:parent].left == nodes[:node]
        if parent.nil?
          @root = nodes[:node]
        else
          parent.right = nodes[:node] if parent.right == node
          parent.left = nodes[:node] if parent.left == node
        end
      end

      @size -= 1
      node.value

    end
end


#### Example usage
# tree = BinarySearchTree.new
# tree.insert("galvanize").insert("apple").insert("pie").insert("pizza").insert("pi")
# puts tree.to_s
# tree.size  #should equal 5
# tree.find("apple") #should return "apple"
# tree.find("apples")  # should return nil

# tree = BinarySearchTree.new
# tree.insert("test").insert("tim").insert("candy").insert("zoo")
# puts tree.find("test")
