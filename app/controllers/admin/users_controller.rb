class Admin::UsersController < Admin::AdminController
  inherit_resources
  actions :all, except: [:show]
  before_filter :require_admin, except: [:update, :edit]

  def index
    @users = User.non_admins
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
      if (@user.admin? and @user != current_user) or @user.nil?
        redirect_to admin_users_path, alert: t('rng_website.user_not_found')
      end
    else
      @user = User.find(current_user.id)
    end
  end

  def create
    create! { admin_users_path }
  end

  def update
    if current_user.no_admin? && params[:user][:username].present?
      render :edit
    else
      update! { current_user.admin ? admin_users_path : admin_path }
    end
  end
end
