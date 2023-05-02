class CreateJoinTableBooksAuthors < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :authors, table_name: :book_authors do |t|
      t.index %i[book_id author_id]
      t.index %i[author_id book_id]
    end
  end
end
