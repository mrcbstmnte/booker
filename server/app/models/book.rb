# frozen_string_literal: true

class Book < ApplicationRecord
  self.primary_key = 'isbn'

  has_many :book_authors
  has_many :authors, through: :book_authors

  def serialize
    {
      authors: author_names,
      edition: edition,
      image_url: image_url,
      isbn: Petrarca.hyphenate(isbn),
      price: price.to_f,
      publication_year: publication_year,
      publisher: publisher_name,
      title: title
    }
  end

  private

  def author_names
    authors
      .pluck(:first_name, :middle_name, :last_name)
      .map { |author| author.compact.join(' ') }
      .join(', ')
  end

  def publisher_name
    Publisher
      .find(publisher_id)
      .name
  end
end
