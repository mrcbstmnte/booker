# frozen_string_literal: true

class BooksController < ApplicationController
  def isbn_conversion
    response = BooksServices::ConvertIsbn.run(params: params)

    render json: response
  end

  def show
    response = BooksServices::GetBook.run(params: params)

    render json: response
  end
end
