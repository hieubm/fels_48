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

  context "POST #create" do
    let(:post_create) {post :create, {category: FactoryGirl.attributes_for(:category)}}

    before {
      log_in admin
    }

    it "should increase category by 1" do
      expect {post_create}.to change(Category, :count).by 1
    end

    it "should redirect to categories list page" do
      post_create
      expect(response).to redirect_to admin_categories_path
    end
  end
end
