module Spree
  class CarouselItem < Base
    default_scope -> { order("position asc") }
    acts_as_list scope: :carousel

    belongs_to :carousel, class_name: 'Spree::Carousel', inverse_of: :items
    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::CarouselImage'
  end
end