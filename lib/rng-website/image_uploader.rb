module RngWebsite
  module ImageUploader
    private
    def get_dimensions_for(image)
      if send("#{image.to_s}").present? && send("#{image.to_s}_changed?")
        geometry = self.send("#{image.to_s}").geometry
        self.send("#{image.to_s}_width=", geometry[0])
        self.send("#{image.to_s}_height=", geometry[1])
      end
    end
  end
end
