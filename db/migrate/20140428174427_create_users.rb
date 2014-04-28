class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :password_digest
    add_index :users, :token, unique: true
  end
end
