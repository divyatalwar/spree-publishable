Spree::OrderContents.class_eval do
  
  def reload_cart_contents
    reload_totals
  end
end