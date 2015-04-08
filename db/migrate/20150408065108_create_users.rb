class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false
      t.string :remember_digest
      t.string :password_digest, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_digest
  end
end
