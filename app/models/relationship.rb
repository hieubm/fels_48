class Relationship < ActiveRecord::Base
  include ActivityModule

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_save :add_activity

  private
  def add_activity
    new_activity self.follower, followed.id, Activity::TYPE_FOLLOW
  end
end
