class StaticPagesController < ApplicationController
  def home
    @activities = Activity.news_feed current_user
  end
end
