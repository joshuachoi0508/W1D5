require 'byebug'
a = a
class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(new_parent)
    @parent.children.delete(self) if @parent && @parent.children.include?(self)
    @parent = new_parent
    if new_parent && !new_parent.children.include?(self)
      new_parent.children << self
    end
  end
  
  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise "Not a child" if !@children.include?(child_node)
    child_node.parent = nil if child_node.parent    
  end
  
  def inspect
    "<PolyTreeNode @value= #{@value}>"
  end
  
  
  def dfs(target_value)
    return self if self.value == target_value
    byebug
    self.children.each do |child|
      search_result = child.dfs(target_value)
      
      return search_result unless search_result.nil?
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      first_node = queue.shift
      return first_node if first_node.value == target_value
      queue += first_node.children
    end
  end
end
