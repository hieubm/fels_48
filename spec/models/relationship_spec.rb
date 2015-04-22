require "rails_helper"

describe Relationship do
  let(:relationship) {FactoryGirl.build :relationship}
  subject {relationship}

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when follower is empty" do
      before {subject.follower = nil}
      it {is_expected.not_to be_valid}
    end

    context "when followed is empty" do
      before {subject.followed = nil}
      it {is_expected.not_to be_valid}
    end
  end

  describe "#add_activity" do
    before {relationship.save}
    subject {Activity.find_by user_id: relationship.follower}
    it {is_expected.not_to be_nil}
  end
end
