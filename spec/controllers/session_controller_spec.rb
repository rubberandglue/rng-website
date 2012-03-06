require 'spec_helper'

describe SessionController do

  before do
    @user = Factory :user, username: "user", password: "123456", password_confirmation: "123456"
  end

  describe "not logged in" do
    it "should get login form" do
      get :new
      response.should be_ok
    end

    describe "logges in" do
      it "with valid user should be successful" do
        post :create, {:login => {username: "user", password: "123456"}}
        response.should redirect_to(admin_path)
      end

      it "with invalid user should not be successful" do
        post :create, {:login => {username: "user", password: "654321"}}
        response.should_not redirect_to(admin_path)
        response.should render_template(:new)
      end
    end

    it "logout should get redirected to login_path" do
      delete :destroy, {:id => @user.id}
      response.should redirect_to(login_path)
    end

  end

  describe "logged in" do
    before do
      login_user
    end

    describe "GET new" do
      it "should not get new" do
        get :new
        response.should_not be_ok
      end

      it "should redirect to admin/news#index" do
        get :new
        response.should redirect_to(admin_path)
      end
    end

    describe "Logout" do
      it "should get redirected to root_path" do
        delete :destroy, {:id => @user.id}
        response.should redirect_to(root_path)
      end
    end
  end
end