class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: false do |t|
      t.references :publisher, null: false, foreign_key: true
      t.string :title, null: false
      t.string :isbn, null: false, primary_key: true
      t.decimal :price, null: false
      t.integer :publication_year, null: false
      t.string :image_url
      t.string :edition

      t.timestamps
    end
  end
end
