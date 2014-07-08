Spree::Variant.class_eval do

  after_save :remove_line_items_from_order, if: :unpublishable?
  scope :publishable, ->{ where publishable: true }
  

  def not_publishable
    !publishable
  end

  def unpublishable?
    publishable_changed? && not_publishable
  end 

  def remove_line_items_from_order
    if is_master?
      product.variants_including_master.each do |variant|
        destroy_items_and_update_order(variant)
      end
    else
      destroy_items_and_update_order(self)      
    end   
  end


  def destroy_items_and_update_order(variant)
    variant.line_items.each do |line_item|
      order = line_item.order
      if !order.complete?
        line_item.destroy 
        update_order_info(order)
      end
    end
  end

  def update_order_info(order)
    updater = Spree::OrderContents.new(order)
    updater.reload_cart
  end

end