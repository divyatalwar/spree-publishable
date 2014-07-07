Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
  :name => 'add_publishable_to_product_edit',
  :insert_after => "erb[loud]:contains('text_field :price')",
  :text => "
    <%= render partial: 'spree/admin/products/publishable_bit', locals: { :@object => @product, :f => f} %>

  ")
