class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :subject, :null => false
      t.text :description, :null => false
      t.string :reference, :null => false
      t.integer :client_id, :null => false
      t.integer :owner_id
      t.integer :status_id, :null => false

      t.timestamps
    end
  end
end
