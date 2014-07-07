Deface::Override.new(:virtual_path => 'spree/admin/products/index',
  :name => 'add_publishable_checkbox_to_products_index',
  :insert_after => 'div.three.columns.omega',
  :text => "
    <div class='search-publishability'>
      <%= f.radio_button :master_publishable_eq, 'true' , :checked => search_contains_publishable?(params, 'true') %>
      <%= f.label :master_publishable_eq, 'Publishable' %>
      <%= f.radio_button :master_publishable_eq, 'false', :checked  => search_contains_publishable?(params, 'false')%>
      <%= f.label:master_publishable_eq, 'UnPublishable' %>
      <%= f.radio_button :master_publishable_eq, nil, :checked => search_contains_publishable?(params, nil)%>
      <%= f.label :master_publishable_eq, 'All' %>
    </div>
  ")
