require "rails_helper"

describe Admin::CategoriesController do
  let(:admin) {FactoryGirl.create :admin_user}

  describe "GET #index" do
    context "when user is not logged in" do
      before do
        get :index
      end
      subject {response}
      it {is_expected.to redirect_to login_path}
    end

    context "when use is logged in" do
      let(:category_1) {FactoryGirl.create :category}
      let(:category_2) {FactoryGirl.create :category}

      before {
        log_in admin
        get :index
      }

      it "should be success" do
        expect(response).to be_success
      end

      it "should show right template" do
        expect(response).to render_template :index
      end

      it "should have 2 categories" do
        expect(assigns(:categories)).to match_array [category_1, category_2]
      end
    end
  end

  describe "POST #create" do
    before {
      log_in admin
      post :create
    }
    subject {response}
    it {is_expected.to redirect_to login_path}
  end
end
