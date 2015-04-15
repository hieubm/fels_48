class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 400}

  def sum_words
    self.words.count
  end
end
