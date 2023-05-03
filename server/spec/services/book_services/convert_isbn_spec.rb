# frozen_string_literal: true

require 'rails_helper'

describe BooksServices::ConvertIsbn do
  let(:arguments) { { params: params } }
  let(:isbn) { '978-1-891830-85-3' }
  let(:params) { { id: isbn } }

  subject { described_class.new(arguments).perform }

  describe '#perform' do
    context 'when the ISBN provided has an invalid format' do
      it 'raises a bad request exception' do
        expect(Booker::Isbn).to receive(:valid?)
          .with(isbn)
          .and_return(false)

        expect { subject }.to raise_error(Booker::BadRequest)
      end
    end

    context 'when the ISBN provided is valid' do
      before do
        allow(Booker::Isbn).to receive(:valid?)
          .and_return(true)
      end

      it 'returns the necessary response with the converted ISBN' do
        expect(Booker::Isbn).to receive(:as_isbn10)
          .with(isbn)
          .and_return('1891830856')

        expect(Booker::Isbn).to receive(:as_isbn13)
          .with(isbn)
          .and_return(Booker::Isbn.sanitize(isbn))

        expect(Booker::Isbn).to receive(:isbn10?)
          .with(isbn)
          .and_return(false)

        expect(Booker::Isbn).to receive(:isbn13?)
          .with(isbn)
          .and_return(true)

        is_expected.to eq(
          {
            source: isbn,
            isbn10: '1-891830-85-6',
            isbn13: isbn,
            is_isbn10: false,
            is_isbn13: true
          }
        )
      end
    end
  end
end
