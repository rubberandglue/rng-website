class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login

  def index

  end
  def require_admin
    unless current_user.admin
      redirect_to admin_news_index_path, alert: "Sie haben nicht die erforderlichen Rechte"
    end
  end
end
