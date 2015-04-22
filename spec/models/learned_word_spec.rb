require "rails_helper"

describe LearnedWord do
  describe "validation" do
    let(:learned_word) {FactoryGirl.build :learned_word}
    subject {learned_word}

    context "when input is valid" do
      before {subject.word = FactoryGirl.create :word, category: subject.category}
      it {is_expected.to be_valid}
    end
  end
end
