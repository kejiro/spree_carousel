module Spree
  class Carousel < Base
    has_many :items, class_name: 'Spree::CarouselItem', foreign_key: :carousel_id do
      def visible
        where("visible = true")
      end
    end

    self.whitelisted_ransackable_attributes = %w[description title]
  end
end
