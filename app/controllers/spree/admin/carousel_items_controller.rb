module Spree
  module Admin
    class CarouselItemsController < ResourceController
      belongs_to 'spree/carousel'

      def update
        invoke_callbacks(:update, :before)

        p = permitted_resource_params

        i = p[:image]
        p.delete(:image)

        unless i.nil?
          image = @object.build_image
          image.attributes = i
        end

        if @object.update_attributes(permitted_resource_params)
          invoke_callbacks(:update, :after)
          respond_with(@object) do |format|
            format.html do
              flash[:success] = flash_message_for(@object, :successfully_updated)
              redirect_to edit_admin_carousel_path(@parent)
            end
            format.js { render layout: false }
          end
        else
          invoke_callbacks(:update, :fails)
          respond_with(@object) do |format|
            format.html { render action: :edit }
            format.js { render layout: false }
          end
        end

      end

      protected

      def find_resource
        if parent_data.present?
          parent.send(:items).find(params[:id])
        else
          model_class.find(params[:id])
        end
      end
    end
  end
end
