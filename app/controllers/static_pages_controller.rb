class StaticPagesController < ApplicationController
  def home
    @activities = Activity.news_feed current_user if logged_in?
  end
end
