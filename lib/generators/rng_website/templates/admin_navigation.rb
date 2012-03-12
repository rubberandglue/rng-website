# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |admin|
  admin.selected_class = 'active'
  admin.items do |primary|
    primary.item :users,    User.model_name.human, admin_users_path, if: Proc.new {current_user.admin}
    primary.item :profile,  t('rng_website.nav.profile'), edit_admin_user_path(current_user)
    primary.item :logout,   t('rng_website.logout.button'), logout_path, method: :delete
  end

end
