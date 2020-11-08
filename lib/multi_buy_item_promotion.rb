require_relative 'discount_item_delegator'

class MultiBuyItemPromotion
  attr_reader :code, :minimum, :price

  def initialize(code:, minimum:, price:)
    @code = code
    @minimum = minimum
    @price = price
  end

  def apply(items)
    if meets_criteria?(items)
      apply_price_delegators(items)
    else
      items
    end
  end

  private def matches?(item)
    item.code == code
  end

  private def meets_criteria?(items)
    items.count { |item| matches?(item) } >= minimum
  end

  private def apply_price_delegators(items)
    items.map do |item|
      matches?(item) ? DiscountItemDelegator.discount(item: item, price: price) : item
    end
  end
end
