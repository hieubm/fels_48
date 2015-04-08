class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :category_id, null: false
      t.string :content

      t.timestamps null: false
    end

    add_index :words, :category_id
  end
end
