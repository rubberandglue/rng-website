class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login

  def index
  end

  def require_admin
    unless current_user.admin
      redirect_to admin_path, alert: t('rng_website.no_rights')
    end
  end
end
