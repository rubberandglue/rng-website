module BootstrapHelper
  def header(name)
    content_tag :div, content_tag(:h1, name), class: 'page-header'
  end

  def add_link_to(name, url, options={})
    icon_link_to name, url, 'plus', options
  end

  def delete_button_for(url, item)
    icon_button_to t('form.delete'), url, 'trash icon-white', class: 'btn-danger', method: :delete, confirm: t('form.delete_msg', item: item)
  end

  alias :delete_button_to :delete_button_for

  def back_button_to(url, options={})
    icon_button_to t('form.back'), url, 'arrow-left', options
  end

  def footer_back_button_to(url)
    content_tag :div, class: 'form-actions' do
      back_button_to(url)
    end
  end

  def edit_link_to(name, url, options={})
    icon_link_to name, url, 'edit', options
  end

  def edit_button_to(name, url, options={})
    icon_button_to name, url, 'edit', options
  end

  def back_link_to(url)
    icon_link_to t("form.back"), url, 'arrow-left'
  end

  def icon_button_to(name, url, icon, options={})
    options[:class] = "btn #{options[:class]}"
    icon_link_to name, url, icon, options
  end

  def icon_link_to(name, url, icon, options={})
    link_to url, options do
      "<i class='icon-#{icon}'></i> ".html_safe +
              name
    end
  end
end