module BootstrapHelper
  def delete_button_for(url, item)
    link_to url, class: 'btn btn-danger', methode: 'delete', confirm: t('form.delete_msg', item: item) do
      "<i class='icon-trash icon-white'></i> ".html_safe +
      t('form.delete')
    end
  end
end