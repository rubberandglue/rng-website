require 'spec_helper'

describe Admin::UsersController do

  describe "not logged in" do
    before do
      @user = Factory :user
    end

    it "GET index should get redirected to login_path" do
      get :index
      response.should redirect_to(login_path)
    end

    it "GET new should get redirected to login_path" do
      get :new
      response.should redirect_to(login_path)
    end

    it "GET edit should get redirected to login_path" do
      get :edit, {id: @user.id}
      response.should redirect_to(login_path)
    end

    it "POST create should get redirected to login_path" do
      post :create, {:user => Factory.attributes_for(:user)}
      response.should redirect_to(login_path)
    end

    it "PUT update should get redirected to login_path" do
      put :update, {:id => @user.id, :user => {title: "News New"}}
      response.should redirect_to(login_path)
    end

    it "DELETE should get redirected to login_path" do
      delete :destroy, {:id => @user.id}
      response.should redirect_to(login_path)
    end
  end

  describe "logged in as non admin" do

    before do
      @user = Factory :user
      login_user
    end

    describe "should not GET index" do
      it "assigns all users as @users" do
        get :index
        response.should redirect_to(admin_path)
      end
    end

    describe "GET new" do
      it "should not be able to get new" do
        get :new
        response.should redirect_to(admin_path)
      end
    end

    describe "GET edit" do
      it "assigns the current user as @user" do
        get :edit, {:id => @user.id}
        assigns(:user).should eq(@user)
      end

      it "should not be able to request anyone else" do
        tmp_user = Factory :user, username: "test"
        get :edit, {id: tmp_user.id}
        assigns(:user).should eq(@user)
        assigns(:user).should_not eq(tmp_user)
      end
    end

    describe "POST create" do
      describe "should not be able to" do
        it "creates a new User" do
          expect {
            post :create, {:user => Factory.attributes_for(:user)}
          }.to change(User, :count).by(0)
        end

        it "redirects to the created user" do
          post :create, {:user => Factory.attributes_for(:user)}
          response.should redirect_to(admin_path)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested user" do
          User.any_instance.should_receive(:update_attributes).with({'password' => '654321', 'password_confirmation' => '654321'})
          put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
        end

        it "assigns the requested user as @user" do
          put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
          assigns(:user).should eq(@user)
        end

        it "redirects to the user" do
          put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
          response.should redirect_to(admin_path)
        end
      end

      describe "with invalid params" do
        it "not matching passworde" do
          put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '123456'}}
          response.should render_template("edit")
        end

        it "username" do
          put :update, {:id => @user.id, :user => {username: 'username change'}}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "should not be able to destroys the requested user" do
        expect {
          delete :destroy, {:id => @user.id}
        }.to change(User, :count).by(0)
      end

      it "redirects to the admin path, AK admin_path" do
        delete :destroy, {:id => @user.id}
        response.should redirect_to(admin_path)
      end
    end
  end

  describe "logged in as admin" do

      before do
        @user = Factory :user, admin: true
        @non_admin = Factory :user, username: 'non_admin', admin: false
        login_user
      end

      describe "GET index" do
        it "assigns all non admin users as @users" do
          get :index
          assigns(:users).should eq([@non_admin])
        end
      end

      describe "GET new" do
        it "assigns a new user as @user" do
          get :new
          assigns(:user).should be_a_new(User)
        end
      end

      describe "GET edit" do
        it "assigns the requested user as @user" do
          get :edit, {:id => @user.id}
          assigns(:user).should eq(@user)
        end
      end

      describe "POST create" do
        describe "with valid params" do
          it "creates a new User" do
            expect {
              post :create, {:user => Factory.attributes_for(:user)}
            }.to change(User, :count).by(1)
          end

          it "redirects to user index" do
            post :create, {:user => Factory.attributes_for(:user)}
            response.should redirect_to(admin_users_path)
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved user as @user" do
            post :create, {:uesr => {}}
            assigns(:user).should be_a_new(User)
          end

          it "re-renders the 'new' template" do
            post :create, {:user => {}}
            response.should render_template("new")
          end
        end
      end

      describe "PUT update" do
        describe "with valid params" do
          it "updates the requested user" do
            User.any_instance.should_receive(:update_attributes).with({'password' => '654321', 'password_confirmation' => '654321'})
            put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
          end

          it "assigns the requested user as @user" do
            put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
            assigns(:user).should eq(@user)
          end

          it "redirects to user index" do
            put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '654321'}}
            response.should redirect_to(admin_users_path)
          end

          it "username" do
            put :update, {:id => @user.id, :user => {username: 'username change'}}
            assigns(:user).username.should eq('username change')
          end
        end

        describe "with invalid params" do
          it "not matching passworde" do
            put :update, {:id => @user.id, :user => {password: '654321', password_confirmation: '123456'}}
            response.should render_template("edit")
          end
        end
      end

      describe "DELETE destroy" do
        it "should be able to destroys the requested user" do
          expect {
            delete :destroy, {:id => @user.id}
          }.to change(User, :count).by(-1)
        end

        it "redirects to the user index path" do
          delete :destroy, {:id => @user.id}
          response.should redirect_to(admin_users_path)
        end
      end
    end

end
