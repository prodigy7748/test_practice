require 'rails_helper'

RSpec.describe Rating, type: :model do

  it 'valid if score is between 0 and 10' do
    0.upto(10).each do |i|
      rating = Rating.new(score: i)
      rating.valid?
      expect(rating.errors[:score]).to be_empty
    end
  end

  it 'invalid if score is less than 0' do
    rating = Rating.new(score: -1)
    rating.valid?
    expect(rating.errors[:score]).not_to be_empty
  end

  it 'invalid if score is greater than 10' do
    rating = Rating.new(score: 11)
    rating.valid?
    expect(rating.errors[:score]).not_to be_empty
  end

  it 'promoter? returns true if score is 9 or 10' do
    9.upto(10).each do |i|
      rating = Rating.new(score: 9)
      expect rating.promoter?
    end
  end
end
