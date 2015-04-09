class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :lesson_id, null: false
      t.integer :word_id, null: false
      t.integer :answer_id
      t.boolean :correct, null: false, default: false

      t.timestamps null: false
    end

    add_index :answer_sheets, :lesson_id
  end
end
