class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answer_sheets

  validates :user_id, presence: true
  validates :category_id, presence: true
end
