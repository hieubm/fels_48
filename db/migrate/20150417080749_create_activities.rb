class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :target_id
      t.integer :action_type
      t.string :message

      t.timestamps null: false
    end

    add_index :activities, :user_id
  end
end
