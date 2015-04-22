require "rails_helper"

describe AnswerSheet do
  let(:answer_sheet) {FactoryGirl.build :answer_sheet}
  subject {answer_sheet}

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when word is not provided" do
      before {subject.word = nil}
      it {is_expected.not_to be_valid}
    end

    context "when correct is not provided" do
      before {subject.correct = nil}
      it {is_expected.not_to be_valid}
    end
  end
end
