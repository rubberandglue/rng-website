class Admin::UsersController < Admin::AdminController
  inherit_resources
  actions :all, except: [:show]
  before_filter :require_admin, except: [:update, :edit]

  def index
    @users = User.non_admins
  end

  def edit
    @user = User.find(current_user.id) unless current_user.admin
    edit!
  end

  def create
    create! { admin_users_path }
  end

  def update
    if current_user.no_admin? && params[:user][:username].present?
      render :edit
    else
      update! { current_user.admin ? admin_users_path : admin_news_index_path}
    end
  end
end
