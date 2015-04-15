class Lesson < ActiveRecord::Base
  before_save :update_correct_num
  after_save :update_learned_words

  belongs_to :user
  belongs_to :category
  has_many :answer_sheets

  validates :user_id, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :answer_sheets

  private
  def update_correct_num
    self.answer_sheets.each do |answer_sheet|
      if answer_sheet.answer_id == answer_sheet.word.answers.correct.first.id
        answer_sheet.correct = true
        self.correct_num += 1
      end
    end
  end

  def update_learned_words
    self.answer_sheets.each do |answer_sheet|
      if answer_sheet.answer_id == answer_sheet.word.answers.correct.first.id
        learned_word = self.user.learned_words.build
        learned_word.category = self.category
        learned_word.word = answer_sheet.word
        learned_word.save
      end
    end
  end
end
