class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :word_id, null: false
      t.string :content
      t.boolean :correct, null: false, default: false

      t.timestamps null: false
    end

    add_index :answers, :word_id
  end
end
