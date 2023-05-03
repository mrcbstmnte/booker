# frozen_string_literal: true

require 'rails_helper'

describe BooksServices::GetBook do
  let(:arguments) { { params: params } }
  let(:book) { double }
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
      context 'when the book was not found' do
        before do
          allow(Book).to receive(:find)
            .and_raise(ActiveRecord::RecordNotFound)
        end

        it 'raises a not found exception' do
          expect { subject }.to raise_error(Booker::NotFound)
        end
      end

      context 'when the book was found' do
        before do
          allow(Book).to receive(:find)
            .and_return(book)
          allow(book).to receive(:serialize)
            .and_return(book)
        end

        it 'returns the serialized book' do
          expect(Book).to receive(:find)
            .with(Booker::Isbn.as_isbn13(isbn))

          is_expected.to eq(book)
        end
      end
    end
  end
end
