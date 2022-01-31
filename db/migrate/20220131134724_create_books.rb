class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :number_of_copies, default: 1
      t.timestamps
    end
  end
end
