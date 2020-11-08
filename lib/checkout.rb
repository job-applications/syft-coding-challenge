class Checkout
  attr_reader :items, :promotional_rules

  def initialize(promotional_rules = nil, items: [])
    @items = items
    @promotional_rules = promotional_rules
    # promotional_rules should have .items and .basket, and we pass this to a checkout total routine
  end

  def scan(item)
    items << item
  end

  def total
    promotional_rules&.total(items) || items.sum { |item| item.price }
  end
end
