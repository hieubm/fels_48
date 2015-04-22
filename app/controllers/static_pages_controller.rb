class StaticPagesController < ApplicationController
  include SessionsHelper
  def home
    @activities = Activity.news_feed current_user if logged_in?
  end
end
