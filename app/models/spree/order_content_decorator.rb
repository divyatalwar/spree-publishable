Spree::OrderContents.class_eval do
  
  def reload_cart
    reload_totals
  end
end