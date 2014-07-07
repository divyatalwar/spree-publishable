class AddPublishableToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :publishable, :boolean, default: false
  end
end
