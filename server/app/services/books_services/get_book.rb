# frozen_string_literal: true

module BooksServices
  class GetBook < ApplicationService
    arguments :params

    def perform
      raise Booker::BadRequest, 'Invalid ISBN format' unless Booker::Isbn.valid?(params[:id])

      book.serialize
    end

    private

    def book
      Book.find(Booker::Isbn.as_isbn13(params[:id]))
    rescue ActiveRecord::RecordNotFound
      raise Booker::NotFound, "Book with ISBN: #{params[:id]} not found."
    end
  end
end
