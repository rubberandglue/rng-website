module RedcarpetHelper
  def markdown(text)
    if defined?(::Redcarpet)
      rndr = Redcarpet::Render::HTML.new(hard_wrap: true)
      Redcarpet::Markdown.new(rndr, no_intra_emphasis: true, autolink: true).render(text).html_safe
    else
      text
    end
  end
end