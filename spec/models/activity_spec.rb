require "rails_helper"

describe Activity do
  describe ".news_feed" do
    context "user follows friend, friend learns a lesson, someone follows friend" do
      before do
        user = FactoryGirl.create :user
        friend = FactoryGirl.create :user
        user.follow friend

        lesson = FactoryGirl.build :lesson, user: friend
        lesson.save

        some_one = FactoryGirl.create :user
        some_one.follow friend

        @news_feed = Activity.news_feed user
      end

      it "should have only 2 activities" do
        expect(@news_feed.length).to eq 2
      end

      it "should have newest activity is 'learned'" do
        expect(@news_feed.first.message).to include "learned"
      end

      it "should have older activity is 'followed'" do
        expect(@news_feed.second.message).to include "followed"
      end
    end
  end
end
