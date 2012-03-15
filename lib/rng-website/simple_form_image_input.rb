class ImageInput < SimpleForm::Inputs::FileInput
  def input
    version = input_html_options.delete(:version)
    out = ''
    if object.send("#{attribute_name}?")
      out << template.image_tag(object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url'), class: 'preview-image')
      out << "<p class='help-block'>"
      out << template.label_tag("#{object.class.name.to_s.downcase}_remove_#{attribute_name}", I18n.t('form.remove_image'))
      out << template.check_box_tag("#{object.class.name.to_s.downcase}[remove_#{attribute_name}]")
      out << "</p>"
    end
    (out << super).html_safe
  end
end