class AnswerSheet < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer

  validates :word_id, presence: true
  validates :correct, inclusion: {in: [true, false]}
  validates :correct, exclusion: {in: [nil]}
end
