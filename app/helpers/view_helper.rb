module ViewHelper
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  def display_flash_messages
    if flash.any?
      flash.map do |type, message|
        content_tag :div, class: "alert alert-#{(type == :notice ? "success" : "error")}" do
          content_tag(:a, 'x', class: 'close', data: { dismiss: 'alert' }) +
          content_tag(:p, message)
        end
      end.join.html_safe
    end
  end

  def site_title(title, header = :h1)
    content_for :title, title
    content_tag :div, class: 'page-header' do
      content_tag header, title
    end
  end
end