module Spree
  module Admin
    ProductsHelper.class_eval do
      def search_contains_publishable?(params, value)
        publishability_bit = (params[:q].present? ? params[:q][:master_publishable_eq] : ' ' )
        return value == publishability_bit
      end
    end
  end
end