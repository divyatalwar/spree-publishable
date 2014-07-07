Spree::OrderContents.class_eval do
  
  def update_cart_info
    reload_totals
  end
end