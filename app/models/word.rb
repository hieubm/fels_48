class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :category
  has_many :answer_sheets, dependent: :destroy

  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
  validate :check_correct

  accepts_nested_attributes_for :answers

  scope :learned_words, ->user {where "id IN
                                  (SELECT word_id FROM learned_words WHERE user_id = ?)",
                                  user.id}

  scope :not_learned_words, ->user {where "id NOT IN
                                  (SELECT word_id FROM learned_words WHERE user_id = ?)",
                                  user.id}

  scope :random_words, ->user {Word.not_learned_words(user).order("RAND()").limit 20}

  private
  def check_correct
    if !answers.empty? && answers.select{|op| op.correct}.blank?
      errors.add(:base, "You have to choose a correct option")
    end
  end
end
