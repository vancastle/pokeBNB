class CorrectionOfUsername < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :usernmae
  end
end
