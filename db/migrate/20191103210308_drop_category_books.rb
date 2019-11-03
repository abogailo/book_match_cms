class DropCategoryBooks < ActiveRecord::Migration[6.0]
  def change
    drop_table :category_books
  end
end
