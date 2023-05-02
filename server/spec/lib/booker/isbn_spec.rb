# frozen_string_literal: true

require 'rails_helper'

describe Booker::Isbn do
  let(:isbn10) { '1-891-83002-3' }
  let(:isbn13) { '978-1-891830-02-0' }

  describe '#as_isbn10' do
    it 'converts given isbn to a sanitized isbn10' do
      expect(described_class.as_isbn10(isbn10)).to eq('1891830023')
      expect(described_class.as_isbn10(isbn13)).to eq('1891830023')
    end
  end

  describe '#as_isbn13' do
    it 'converts given isbn to a sanitized isbn13' do
      expect(described_class.as_isbn13(isbn10)).to eq('9781891830020')
      expect(described_class.as_isbn13(isbn13)).to eq('9781891830020')
    end
  end

  describe '#isbn10?' do
    subject { described_class.isbn10?(isbn) }

    context 'when the value contains invalid characters' do
      let(:isbn) { 'ACDEDDFF' }

      it { is_expected.to be_falsey }
    end

    context 'when sanitized value has size not equal to 10' do
      let(:isbn) { '18918300231' }

      it { is_expected.to be_falsey }
    end

    context 'when the checkdigit has a remainder not equal to 0' do
      let(:isbn) { '1891830021' }

      it { is_expected.to be_falsey }
    end

    context 'when the value provided is valid' do
      let(:isbn) { '1891830023' }

      it { is_expected.to be_truthy }
    end
  end

  describe '#isbn13?' do
    subject { described_class.isbn13?(isbn) }

    context 'when the value contains invalid characters' do
      let(:isbn) { 'ACDEDDFF' }

      it { is_expected.to be_falsey }
    end

    context 'when sanitized value has size not equal to 13' do
      let(:isbn) { '97818918300201' }

      it { is_expected.to be_falsey }
    end

    context 'when the checkdigit has a remainder not equal to 0' do
      let(:isbn) { '9781891830023' }

      it { is_expected.to be_falsey }
    end

    context 'when the value provided is valid' do
      let(:isbn) { '9781891830020' }

      it { is_expected.to be_truthy }
    end
  end

  describe '#sanitize' do
    let(:isbn) { '978-1-891830-02-0' }

    subject { described_class.sanitize(isbn) }

    it 'sanitizes given isbn' do
      is_expected.to eq('9781891830020')
    end
  end

  describe '#valid?' do
    let(:isbn) { '9781891830020' }

    subject { described_class.valid?(isbn) }

    context 'when the value provided belongs to isbn10' do
      let(:isbn) { '1891830023' }

      it { is_expected.to be_truthy }
    end

    context 'when the value provided belongs to isbn13' do
      it { is_expected.to be_truthy }
    end

    context 'when the value provided is not valid' do
      let(:isbn) { '123123123123123' }

      it { is_expected.to be_falsey }
    end
  end
end
