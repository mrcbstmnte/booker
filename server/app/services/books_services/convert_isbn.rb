# frozen_string_literal: true

module BooksServices
  class ConvertIsbn < ApplicationService
    arguments :params

    def perform
      raise Booker::BadRequest, 'Invalid ISBN format' unless Booker::Isbn.valid?(params[:id])

      response
    end

    private

    def response
      {
        source: params[:id],
        isbn10: isbn10,
        isbn13: isbn13,
        is_isbn10: Booker::Isbn.isbn10?(params[:id]),
        is_isbn13: Booker::Isbn.isbn13?(params[:id])
      }
    end

    def isbn10
      isbn = Booker::Isbn.as_isbn10 params[:id]

      Petrarca.hyphenate isbn
    end

    def isbn13
      isbn = Booker::Isbn.as_isbn13 params[:id]

      Petrarca.hyphenate isbn
    end
  end
end
