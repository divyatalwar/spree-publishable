module Spree
  module Admin
    ProductsController.class_eval do
      # alias_method :old_collection, :collection
     
      # def collection
      #   old_collection
      #   if params[:q][:publishability].present?
      #     @collection = (params[:q][:publishability] == '1' ? @collection.publishable : @collection.unpublishable)
      #   end
      #   @collection        
      # end
    end
  end
end