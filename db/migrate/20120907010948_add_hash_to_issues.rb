class AddHashToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :access_hash, :string, :null => false
  end
end
