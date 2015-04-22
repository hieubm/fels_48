require "rails_helper"

describe Lesson do
  let(:lesson) {FactoryGirl.build :lesson}
  subject {lesson}

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when user is not provided" do
      before {subject.user = nil}
      it {is_expected.not_to be_valid}
    end

    context "when category is not provided" do
      before {subject.category = nil}
      it {is_expected.not_to be_valid}
    end
  end

  describe "finish a lesson" do
    context "when has 1 correct answer" do
      before do
        answer_sheet = FactoryGirl.build :answer_sheet
        answer_sheet.answer = answer_sheet.word.answers.correct.first
        lesson.answer_sheets << answer_sheet
        lesson.save
      end

      it "should has correct_num is 1" do
        expect(lesson.correct_num).to eq 1
      end

      it "should add learned word for user" do
        learned_word = LearnedWord.find_by user: lesson.user,
                                           word: lesson.answer_sheets.first.word
        expect(learned_word).not_to be_nil
      end

      it "should add activity: learned 1 word" do
        activity = Activity.find_by user: lesson.user, target_id: lesson.id
        expect(activity.message).to include "learned 1 word"
      end
    end

    context "when has no correct answer" do
      before do
        answer_sheet = FactoryGirl.build :answer_sheet
        answer_sheet.answer = answer_sheet.word.answers.not_correct.first
        lesson.answer_sheets << answer_sheet
        lesson.save
      end

      it "should has correct_num is 1" do
        expect(lesson.correct_num).to eq 0
      end

      it "should add learned word for user" do
        learned_word = LearnedWord.find_by user: lesson.user,
                                           word: lesson.answer_sheets.first.word
        expect(learned_word).to be_nil
      end

      it "should add activity: learned 0 word" do
        activity = Activity.find_by user: lesson.user, target_id: lesson.id
        expect(activity.message).to include "learned 0 word"
      end
    end
  end
end
