module Spree
  class CarouselItem < Base
    belongs_to :carousel, class_name: 'Spree::Carousel', inverse_of: :items
    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::CarouselImage'
  end
end