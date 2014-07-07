Deface::Override.new(:virtual_path => 'spree/admin/variants/_form',
  :name => 'add_publishable_to_variant_edit',
  :insert_after => "erb[loud]:contains('text_field :sku')",
  :text => "
    <%= render partial: 'spree/admin/products/publishable_bit', locals: { :@object => (@variant.presence || @product), :f => f } %>
   ")
