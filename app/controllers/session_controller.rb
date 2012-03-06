class SessionController < ApplicationController
  def new
    if current_user
      redirect_to admin_path
    end
  end

  def create
    user = login(params[:login][:username], params[:login][:password])
    if user
      redirect_back_or_to admin_path, notice: t('rng_website.login.success')
    else
      flash.now.alert = t('rng_website.login.error')
      render :new
    end
  end

  def destroy
    if current_user
      logout
      redirect_to root_url, notice: t('rng_website.logout.success')
    else
      redirect_to login_path, notice: t('rng_website.logout.error')
    end
  end

end
