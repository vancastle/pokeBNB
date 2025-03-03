class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :deck, null: false, foreign_key: true
      t.date :date_of_beginning
      t.date :date_of_end

      t.timestamps
    end
  end
end
