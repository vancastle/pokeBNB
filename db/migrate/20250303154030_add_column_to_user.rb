class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :usernmae, :string, null: false, default: ""

    add_index :users, :username, unique: true
  end
end
