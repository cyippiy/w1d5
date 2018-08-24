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
    if node.nil?
      @parent = nil
    elsif #node.is_a?(PolyTreeNode)
  
      #old parent
      @parent.remove_child(self)
      @parent=node
      #this sets self to new parent's children
      @parent.add_child(self)

    end
  end  
  
  def add_child(node)
    self.children << node if self.children.none?(node)  
    node.parent = self
  end
  
  def remove_child(node)
    #checks if child does not have node and error
    raise "Error" unless @children.none?(node)
    
    #assumes children node exists
    node.parent = nil
    @children.delete(node)
  end
  
  
  
end

# t1 = PolyTreeNode.new(1)
# t2 = PolyTreeNode.new(2)
# t3 = PolyTreeNode.new(3)
# 
# t1.children << t2
# t2.parent = t3


