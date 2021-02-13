require 'rails_helper'

RSpec.describe Rating, type: :model do

  it 'valid if score is between 0 and 10' do
    rating = Rating.new(score: 10)
    rating.valid?
    expect(rating.errors[:score]).to be_empty
  end

  it 'invalid if score is less than 0' do
    rating = Rating.new(score: -1)
    rating.valid?
    expect(rating.errors[:score]).not_to be_empty
  end
end
