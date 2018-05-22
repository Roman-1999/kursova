class AddComplexityToIssue < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :complexity, :integer
    add_index :issues, :complexity
end
end
