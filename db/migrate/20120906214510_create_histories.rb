class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :issue_id, :null => false
      t.integer :staff_id, :null => false
      t.text :reply, :null => false
      t.integer :old_status_id
      t.integer :new_status_id
      t.integer :old_owner_id
      t.integer :new_owner_id

      t.timestamps
    end
  end
end
