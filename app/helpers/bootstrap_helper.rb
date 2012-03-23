module BootstrapHelper
  def header(name)
    content_tag :div, content_tag(:h1, name), class: 'page-header'

  end

  def delete_button_for(url, item)
    link_to url, class: 'btn btn-mini btn-danger', method: :delete, confirm: t('form.delete_msg', item: item) do
      "<i class='icon-trash icon-white'></i> ".html_safe +
      t('form.delete')
    end
  end

  def back_button_to(url)
    link_to url, class: 'btn' do
      "<i class='icon-arrow-left'></i> ".html_safe +
      t('form.back')
    end
  end

  def edit_link_to(name, url)
    link_to url do
      "<i class='icon-edit'></i> ".html_safe +
      name
    end
  end

  def edit_button_to(name, url)
    link_to url, class: 'btn btn-mini' do
      "<i class='icon-edit'></i> ".html_safe +
      t('form.edit')
    end
  end

end