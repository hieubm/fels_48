class Category < ActiveRecord::Base
  has_many :lesson, dependent: :destroy
  has_many :word, dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 400}
end
