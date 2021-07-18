class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :user
      t.references :friend

      t.timestamps
    end

    add_foreign_key :connections, :users, column: :user_id, primary_key: :id
    add_foreign_key :connections, :users, column: :friend_id, primary_key: :id
  end
end
