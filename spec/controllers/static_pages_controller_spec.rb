require "rails_helper"

describe StaticPagesController do
  describe "GET #index" do
    context "when user is not logged in" do
      it "response success with HTTP 200" do
        get :home
        expect(response).to be_success
        expect(response).to have_http_status 200
      end

      it "renders index template" do
        get :home
        expect(response).to render_template("static_pages/home")
      end
    end

    context "when use is logged in" do
      before do
        user = FactoryGirl.create :user
        log_in user
        get :home
      end
      subject {response}
      it {is_expected.to be_success}
      it {is_expected.to have_http_status 200}
      it {is_expected.to render_template :home}
    end
  end
end
