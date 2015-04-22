require "rails_helper"

describe Word do
  let(:word) {FactoryGirl.build :word}
  subject {word}

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

    context "when has one correct answer" do
      subject {FactoryGirl.create :word_with_a_correct_answer}
      it {is_expected.to be_valid}
    end

    context "when has no correct answer" do
      subject {FactoryGirl.create :word_with_no_correct_answer}
      it {is_expected.not_to be_valid}
    end
  end
end
