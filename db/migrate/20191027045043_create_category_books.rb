class CreateCategoryBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :category_books do |t|
      t.integer :book_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
