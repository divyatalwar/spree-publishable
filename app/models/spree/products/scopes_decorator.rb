module Spree
  Product.class_eval do
    
    # def self.available(available_on = nil, currency = nil)
    #   publishable.joins(:prices).where("#{Product.quoted_table_name}.available_on <= ?", available_on || Time.now)
    # end
    def self.active(currency = nil)
      not_deleted.available(nil, currency).publishable
    end
  end
end