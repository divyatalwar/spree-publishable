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
      line_item.destroy
      update_order_status(order)
    end
  end

  def update_order_status(order)
    updater = Spree::OrderContents.new(order)
    updater.update_cart_info#send(:reload_totals)
    # order_updater = Spree::OrderUpdater.new(order)
    # order_updater.update_item_count
    # order_updater.update_item_total
    # order_updater.update_adjustment_total
    # order_updater.update_payment_state if order.completed?
    # order_updater.persist_totals
    # order.reload
  end

end