module Spree
  module CarouselsHelper
    def render_carousel(name)
      # noinspection RailsChecklist05
      carousel = Spree::Carousel.find_by_title name
      @carousel = []
      @carousel = carousel.visible_items unless carousel.nil?
      render partial: "spree/carousels/carousel"
    end
  end
end

