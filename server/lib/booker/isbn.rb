# frozen_string_literal: true

module Booker
  class Isbn
    ISBN10_DIVISOR = 11
    ISBN13_DIVISOR = 10
    ISBN13_PREFIX = '978'

    class << self
      def as_isbn10(isbn)
        sanitized = sanitize(isbn)
        sanitized = sanitized.size == 10 ? sanitized : sanitized.delete_prefix(ISBN13_PREFIX)

        isbn_a = isbn_to_a(sanitized)
        isbn_a.pop

        checkdigit = ISBN10_DIVISOR - isbn10_checkdigit(isbn_a)

        isbn_a.push(checkdigit == 10 ? 'X' : checkdigit)

        isbn_a.join
      end

      def as_isbn13(isbn)
        sanitized = sanitize(isbn)
        sanitized = sanitized.size == 13 ? sanitized : "#{ISBN13_PREFIX}#{sanitized}"

        isbn_a = isbn_to_a(sanitized)
        isbn_a.pop

        checkdigit = ISBN13_DIVISOR - isbn13_checkdigit(isbn_a)

        isbn_a.push(checkdigit == 10 ? 0 : checkdigit)

        isbn_a.join
      end

      def isbn10?(isbn)
        return false if /[A-WYZa-z]+/ =~ isbn

        sanitized = sanitize(isbn)

        return false if sanitized.length != 10

        checkdigit = isbn10_checkdigit(isbn_to_a(sanitized))

        return false if checkdigit != 0

        true
      end

      def isbn13?(isbn)
        return false if /[A-Za-z]+/ =~ isbn

        sanitized = sanitize(isbn)

        return false if sanitized.length != 13

        checkdigit = isbn13_checkdigit(isbn_to_a(sanitized))

        return false if checkdigit != 0

        true
      end

      def sanitize(isbn)
        isbn.gsub(/[\s-]*/, '')
      end

      def valid?(isbn)
        case sanitize(isbn).size
        when 10
          isbn10?(isbn)
        when 13
          isbn13?(isbn)
        end
      end

      private

      def isbn10_checkdigit(isbn)
        sum = 0

        isbn.each_with_index do |digit, index|
          sum += (digit == 'X' ? 10 : digit).to_i * (10 - index)
        end

        sum % ISBN10_DIVISOR
      end

      def isbn13_checkdigit(isbn)
        sum = 0

        isbn.each_with_index do |digit, index|
          sum += digit.to_i * (index.odd? ? 3 : 1)
        end

        sum % ISBN13_DIVISOR
      end

      def isbn_to_a(isbn)
        isbn.split('')
      end
    end
  end
end
