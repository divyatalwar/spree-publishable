Spree::Product.class_eval do
  
  delegate_belongs_to :master, :publishable
  # scope :publishable, ->{ join(Master.arel_table).where(spree_variants: { publishable: true }) }
  # scope :negate, ->(scope) { where(scope.where_values.reduce(:and).not) }
  scope :publishable, ->{ joins(:master).where(spree_variants: { publishable: true }) }
  # scope :unpublishable, ->{ joins(:master).where(spree_variants: { publishable: false }) }
  
  def variants_and_option_values(current_currency = nil)
    variants.publishable.includes(:option_values).active(current_currency).select do |variant|
      variant.option_values.any?
    end
  end

end