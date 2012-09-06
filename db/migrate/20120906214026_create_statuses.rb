class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :kind, :null => false
      t.string :title, :null => false

      t.timestamps
    end
  end
end
