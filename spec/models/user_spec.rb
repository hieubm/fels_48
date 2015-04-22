require "rails_helper"

describe User do
  let(:user) {FactoryGirl.build :user}
  subject {user}

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is empty" do
      before {subject.name = ""}
      it {is_expected.not_to be_valid}
    end

    context "when name is too long" do
      before {subject.name = "a" * 51}
      it {is_expected.not_to be_valid}
    end

    context "when email is invalid" do
      it "should not be valid" do
        ["", "name", "name.com", "name@domain"].each do |invalid_email|
          subject.email = invalid_email
          expect(subject).not_to be_valid
        end
      end
    end

    context "when email is duplicated" do
      before do
        new_user = FactoryGirl.build :user, email: subject.email.upcase
        new_user.save
      end
      it {is_expected.not_to be_valid}
    end

    context "when password is too short" do
      before {subject.password = "123"}
      it {is_expected.not_to be_valid}
    end
  end
end
