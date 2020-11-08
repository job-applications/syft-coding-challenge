class PromotionalRules
  attr_accessor  :basket_rules, :item_rules

  def initialize(basket_rules: [], item_rules: [])
    @basket_rules = basket_rules
    @item_rules = item_rules
  end

  def add_basket_rule(rule)
    basket_rules << rule
  end

  def add_item_rule(rule)
    item_rules << rule
  end

  def total(items)
    apply_basket_discounts(apply_item_discounts(items))
  end

  private def apply_item_discounts(items)
    return items if item_rules.nil? || item_rules.empty?
    item_rules.reduce(items) { |discount_items, rule| rule.apply(discount_items) }
  end

  private def apply_basket_discounts(items)
    total = items.map { |item| item.price }.sum
    return total if basket_rules.nil? || basket_rules.empty?
    basket_rules.reduce(total) { |discount_total, rule| rule.apply(discount_total) }
  end
end
