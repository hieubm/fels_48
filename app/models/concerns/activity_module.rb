module ActivityModule
  def new_activity user, target_id, action_type
    activity = Activity.new user: user, target_id: target_id, action_type: action_type
    activity.save
  end
end
