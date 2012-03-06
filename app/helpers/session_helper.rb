module SessionHelper
  def logout_link
    link_to t('rng_website.logout.button'), logout_path, method: :delete
  end

  def admin?
    current_user && controller.class.name.split("::").first=="Admin"
  end

  def not_admin?
    !admin?
  end
end
