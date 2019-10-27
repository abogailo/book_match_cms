class CreateGenreBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_books do |t|
      t.integer :book_id
      t.integer :genre_id
      
      t.timestamps
    end
  end
end
