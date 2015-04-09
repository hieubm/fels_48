class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :answer_sheet, dependent: :destroy

  validates :word_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
  validates :correct, presence: true
end
