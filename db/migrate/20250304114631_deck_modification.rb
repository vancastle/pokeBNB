class DeckModification < ActiveRecord::Migration[7.1]
  def change
    add_column :decks, :desciption, :string
    add_column :decks, :price, :integer
    add_column :decks, :img_url, :string
  end
end
