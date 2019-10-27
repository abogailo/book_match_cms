class CreateCartBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_books do |t|
      t.integer :book_id
      t.integer :cart_id
      
      t.timestamps
    end
  end
end
