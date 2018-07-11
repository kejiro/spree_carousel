module Spree
  class CarouselImage < Asset
    validate :no_attachment_errors

    def self.accepted_image_types
      %w(image/jpeg image/jpg image/png image/gif)
    end

    has_attached_file :attachment,
                      styles: { mini: '125x50>', small: '250x100>', product: '500x200>', large: '750x300>', gigantic: '1000x400>' },
                      default_style: :large,
                      url: '/spree/carousels/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/carousels/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    validates_attachment :attachment,
                         presence: true,
                         content_type: { content_type: accepted_image_types }

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end

  end
end
