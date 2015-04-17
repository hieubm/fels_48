class Activity < ActiveRecord::Base
  TYPE_FOLLOW = 0
  TYPE_FINISH_LESSON = 1

  belongs_to :user

  scope :latest_first, ->{order(id: :desc)}

  scope :news_feed, ->user {where("user_id = :user_id OR user_id IN
                           (SELECT followed_id FROM relationships WHERE follower_id = :user_id)",
                           user_id: user.id).latest_first}

  before_save :generate_message

  private
  def generate_message
    case self.action_type
    when TYPE_FOLLOW
      target_user = User.find self.target_id
      self.message = "#{self.user.name} followed #{target_user.name}"
    when TYPE_FINISH_LESSON
      lesson = Lesson.find self.target_id
      self.message = "#{self.user.name} learned #{lesson.correct_num} words in lesson #{lesson.category.name}"
    end
  end
end
