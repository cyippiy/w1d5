require "byebug"

class PolyTreeNode
  attr_accessor :value, :parent, :children
  
  def initialize(value=nil)
    @value = value
    @parent = nil
    @children = []
  end
  
  def inspect
    "PolyTreeNode: value: #{@value} parent: #{@parent} children: #{@children}"
  end
  
  def parent=(node)
  
    @parent.children.delete(self) unless @parent.nil?

      @parent = node
      unless @parent.nil?
        @parent.children << self unless @parent.children.include?(self)
      end
  end
  
  def add_child(node)
    if @children.include?(node)
      node.parent = self
    else
      @children << node unless node.nil?
    end
    # if self.children.none?(node)

    # end
    node.parent = self
  end
  
  def remove_child(node)
    node.parent = nil
    raise "Error: not a child" if @children.none?(node)
    @children.delete(node)
  end
  
  def dfs(target_value)
    storage = []
    print storage
    return self if @value == target_value
    

    
    
    unless @children.nil?
      #stores into storage aka stack
      @children.each do |child|
        child.value
        storage.push(child.dfs(target_value))
      end
    end
    
    if @value != target_value
      storage.pop
      return nil
    end
    
    
    # unless value == target_value
    #   storage.pop
    #   return nil
    # end
  end
  
end



