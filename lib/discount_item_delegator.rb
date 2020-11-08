require 'delegate'

class DiscountItemDelegator < SimpleDelegator
  attr_accessor :discount_price

  def self.discount(item:, price:)
    di = self.new(item)
    di.discount_price = price
    di
  end

  def discount?
    !discount_price.nil?
  end

  def price
    discount? ? discount_price : super
  end
end
