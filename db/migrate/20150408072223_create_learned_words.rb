class CreateLearnedWords < ActiveRecord::Migration
  def change
    create_table :learned_words do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :word_id, null: false

      t.timestamps null: false
    end

    add_index :learned_words, :user_id
    add_index :learned_words, [:user_id, :category_id]
  end
end
