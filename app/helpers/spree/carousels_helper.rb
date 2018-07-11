module Spree
  module CarouselsHelper
    def render_carousel(name)
      # noinspection RailsChecklist05
      @carousel = Spree::Carousel.find_by_title name
      render partial: "spree/carousels/carousel"
    end
  end
end

