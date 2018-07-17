class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt

      t.integer :role, default: 0

      t.string :activation_state, default: nil
      t.string :activation_token, default: nil
      t.datetime :activation_token_expires_at, default: nil

      t.datetime :deleted_at
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :activation_token
  end
end
