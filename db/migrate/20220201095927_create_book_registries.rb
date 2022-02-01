class CreateBookRegistries < ActiveRecord::Migration[6.1]
  def change
    create_table :book_registries do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :book_taken_date, default: Time.now
      t.datetime :book_return_date, default: Time.now+ 10.days
      t.timestamps
    end
  end
end
