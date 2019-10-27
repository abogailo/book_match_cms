class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.integer :quantity
      t.string :condition 
      t.float :price 
      t.integer :year_published
      t.integer :admin_id
      
      t.timestamps
    end
  end
end
