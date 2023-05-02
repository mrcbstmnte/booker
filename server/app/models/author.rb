class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :authors_books
end
