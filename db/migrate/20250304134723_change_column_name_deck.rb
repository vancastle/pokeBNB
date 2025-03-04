class ChangeColumnNameDeck < ActiveRecord::Migration[7.1]
  def change
    rename_column :decks, :name, :title
  end
end
