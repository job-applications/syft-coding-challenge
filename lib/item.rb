class Item
  attr_reader :code, :name

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

  def discount?
    false
  end

  def price
    @price
  end
end
