class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :category
  has_many :answer_sheets, dependent: :destroy

  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
  validate :check_correct

  accepts_nested_attributes_for :answers

  private
  def check_correct
    if answers.select{|op| op.correct}.blank?
      errors.add(:base, "You have to choose a correct option")
    end
  end
end
