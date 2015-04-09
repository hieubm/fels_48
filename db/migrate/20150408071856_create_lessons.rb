class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :correct_num, null: false, default: 0
      t.boolean :finished, null: false, default: false

      t.timestamps null: false
    end

    add_index :lessons, :user_id
  end
end
