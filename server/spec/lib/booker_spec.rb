# frozen_string_literal: true

require 'rails_helper'

describe Booker::BadRequest do
  it 'is a StandardError' do
    expect(described_class.superclass).to eq(StandardError)
  end
end

describe Booker::NotFound do
  it 'is a StandardError' do
    expect(described_class.superclass).to eq(StandardError)
  end
end
