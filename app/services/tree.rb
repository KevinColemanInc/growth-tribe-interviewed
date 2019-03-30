class Tree
  def initialize(tree)
    @tree = tree
  end

  def tree; @tree; end

  def id
    @tree['id']
  end

  def child(id, tree=@tree)
    return tree['child'].map { |child| child['id'] } if id == tree['id']

    child = tree['child'].map do |child|
      child(id, child)
    end.flatten.compact

    child.any? ? child : nil
  end

  def parent(id, tree=@tree)
    return tree['id'] if tree['child'].detect { |c| c['id'] == id }
    tree['child'].detect do |child|
      parent(id, child)
    end
  end
end