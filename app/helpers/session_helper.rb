module SessionHelper
  def logout_link
    icon_link_to t('rng_website.logout.button'), logout_path, 'remove', method: :delete
  end

  def admin?
    current_user && controller.class.name.split("::").first=="Admin"
  end

  def not_admin?
    !admin?
  end
end
