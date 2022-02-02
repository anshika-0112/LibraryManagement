class CreateBookRegistries < ActiveRecord::Migration[6.1]
  def change
    create_table :book_registries do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :book_taken_date, default: nil
      t.datetime :book_return_date, default: nil
      t.timestamps
    end
  end
end
