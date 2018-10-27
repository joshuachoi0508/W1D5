class KnightPathFinder
  def initialize(start_pos = [0, 0])
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @visited_positions = [start_pos]
  end
  
  def build_move_tree
    queue = [@root_node]
    new_move_positions(queue.shift.value)
    
  end
  
  def self.valid_moves(pos)
    x = pos.first
    y = pos.last
    
    positions = 
    [[x + 2, y + 1], [x + 2, y - 1]
    [x - 2, y + 1], [x - 2, y - 1]
    [x - 1, y + 2], [x - 1, y - 2] 
    [ x + 1 ,y - 2], [x + 1, y + 2]] 
    
    positions.reject! do |pos| 
      pos[0] < 0 || pos[1] < 0 || pos[0] > 7 || pos[1] > 7
    end  
  end
  
  def new_move_positions(position)
    new_positions = self.valid_moves(position).reject {|pos| @visited_positions.include?(pos)}
    @visited_positions += new_positions
    new_positions
  end
end