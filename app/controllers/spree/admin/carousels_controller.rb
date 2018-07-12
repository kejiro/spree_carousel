module Spree
  module Admin
    class CarouselsController < ResourceController
      include ActionView::Helpers::UrlHelper
      helper_method :toggle_visibility_link


      def model_class
        Spree::Carousel
      end

      def create
        invoke_callbacks(:create, :before)

        @object.record = Spree::Variant.find_by_id(params[:variant_id])
        @object.attributes = permitted_resource_params

        if @object.valid?
          super
        else
          invoke_callbacks(:create, :fails)
          flash[:error] = @object.errors.full_messages.join(", ")
          redirect_to location_after_save
        end
      end

      protected

      def toggle_visibility_link(resource)
        if resource.visible
          url = disable_admin_carousel_item_path(@object, resource)
          icon_name = 'eye-close'
        else
          url = enable_admin_carousel_item_path(@object, resource)
          icon_name = 'eye-open'
        end

        css = "btn btn-outline-secondary btn-sm icon-link with-tip action-#{icon_name}"
        icon = content_tag(:span, '', class: "icon icon-#{icon_name}")
        link_to(icon.html_safe, url, { class: css, data: { method: "put" } })
      end

      def location_after_save
        spree.admin_product_attachments_path(@product)
      end

      def permitted_resource_params
        params.require(:attachment).permit(permitted_digital_attributes)
      end

      def permitted_digital_attributes
        [:bucket, :key, :filename]
      end

      def collection
        return @collection if @collection.present?
        # params[:q] can be blank upon pagination
        params[:q] = {} if params[:q].blank?

        @collection = super
        @search = @collection.ransack(params[:q])
        @collection = @search.result.
            page(params[:page]).
            per(50)
      end

    end
  end
end