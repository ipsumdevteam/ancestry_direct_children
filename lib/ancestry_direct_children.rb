require 'ancestry'

Ancestry::InstanceMethods.module_eval do
  def sibling_count
    return (self.parent.direct_children_count - 1)
  end

  def update_parent_children_count!
    unless self.parent.nil?
      self.parent.direct_children_count = self.parent.child_ids.count
      self.parent.save!
    end
  end

  def update_parent_children_count
    unless self.parent.nil?
      self.parent.update_column(:direct_children_count, self.parent.child_ids.count)
    end
  end
end
