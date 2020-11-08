class BasketPercentageDiscountPromotion
  attr_reader :minimum, :percentage

  def initialize(minimum:, percentage:)
    @minimum = minimum
    @percentage = percentage
  end

  def apply(price)
    meets_criteria?(price) ? (price * multiplier).round(2) : price
  end

  private def multiplier
    1.0 - percentage.fdiv(100)
  end

  private def meets_criteria?(price)
    price >= minimum
  end
end
