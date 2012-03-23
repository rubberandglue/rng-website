module RngWebsite
  module OembedModel
    def get_video_html_for(video, options = {})
      if send("#{video.to_s}?")
        self.send("#{video.to_s}_html=", OEmbed::Providers.get(send(video.to_s), options).html)
      else
        self.send("#{video.to_s}_html=", nil)
      end
    rescue
      errors.add video, I18n.t('rng-website.oembed.error')
    end
  end
end
