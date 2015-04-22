require "rails_helper"

describe Category do
  let(:category) {FactoryGirl.create :category}

  subject {category}

  describe "check members" do
    it {is_expected.to respond_to :name}
    it {is_expected.to respond_to :description}
    it {is_expected.to respond_to :words}
    it {is_expected.to respond_to :lessons}
  end

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is empty" do
      before {subject.name = ""}
      it {is_expected.not_to be_valid}
    end

    context "when name is too long" do
      before {subject.name = "a" * 101}
      it {is_expected.not_to be_valid}
    end

    context "when description is too long" do
      before {subject.description = "a" * 401}
      it {is_expected.not_to be_valid}
    end
  end

  describe "#sum_words" do
    context "when has no word" do
      subject {category.sum_words}
      it {is_expected.to eq 0}
    end

    context "when has 2 words" do
      before do
        category.words.build FactoryGirl.attributes_for :word
        category.words.build FactoryGirl.attributes_for :word
        category.save
      end
      subject {category.sum_words}
      it {is_expected.to eq 2}
    end
  end
end
