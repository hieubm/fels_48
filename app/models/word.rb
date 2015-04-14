class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :category
  has_many :answer_sheets, dependent: :destroy

  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
end
