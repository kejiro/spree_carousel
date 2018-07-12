module Spree
  class Carousel < Base
    has_many :items, class_name: 'Spree::CarouselItem', foreign_key: :carousel_id, inverse_of: :carousel
    has_many :visible_items, -> { where("visible = true") }, class_name: 'Spree::CarouselItem', foreign_key: :carousel_id, inverse_of: :carousel

    self.whitelisted_ransackable_attributes = %w[description title]
  end
end
