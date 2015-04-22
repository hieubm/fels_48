class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :answer_sheets, dependent: :destroy

  validates :content, presence: true, length: {maximum: 100}
  validates :correct, inclusion: {in: [true, false]}
  validates :correct, exclusion: {in: [nil]}

  scope :correct, ->{where correct: true}
  scope :not_correct, ->{where correct: false}
end
