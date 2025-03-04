class CorrectionOfUsername < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :usernmae
    add_column :users, :username, :string, null: false, default: ""
    add_index :users, :username, unique: true
  end
end
