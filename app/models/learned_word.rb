class LearnedWord < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :word

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :word_id, presence: true
end
