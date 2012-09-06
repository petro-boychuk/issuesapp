class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :email, :null => false
      t.string :name

      t.timestamps
    end
  end
end
