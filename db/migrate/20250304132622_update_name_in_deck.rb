class UpdateNameInDeck < ActiveRecord::Migration[7.1]
  def change
    remove_column :decks, :desciption
    add_column :decks, :description, :string
  end
end
