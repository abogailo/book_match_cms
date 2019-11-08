class DropCartBooks < ActiveRecord::Migration[6.0]
  def change
    drop_table :cart_books
  end
end
