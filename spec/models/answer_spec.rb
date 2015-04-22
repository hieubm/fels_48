require "rails_helper"

describe Answer do
  let(:answer) {FactoryGirl.build :answer}
  subject {answer}

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when content is empty" do
      before {subject.content = ""}
      it {is_expected.not_to be_valid}
    end

    context "when content is too long" do
      before {subject.content = "a" * 101}
      it {is_expected.not_to be_valid}
    end

    context "when correct is not provided" do
      before {subject.correct = nil}
      it {is_expected.not_to be_valid}
    end
  end

  describe ".correct" do
    context "has 2 answers, one of them is correct" do
      before do
        wrong_answer = FactoryGirl.create :answer
        @correct_answer = FactoryGirl.create :correct_answer
      end
      subject {Answer.correct.first.id}
      it {is_expected.to eq @correct_answer.id}
    end

    context "has 2 answers, none of them is correct" do
      before do
        wrong_answer_1 = FactoryGirl.create :answer
        wrong_answer_2 = FactoryGirl.create :answer
      end
      subject {Answer.correct.first}
      it {is_expected.to be_nil}
    end
  end
end
