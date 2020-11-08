module MockItems
  def self.heart
    OpenStruct.new(code: '001', name: 'Lavender heart', price: 9.25)
  end

  def self.cufflinks
    OpenStruct.new(code: '002', name: 'Personalised cufflinks', price: 45.00)
  end

  def self.kids_tshirt
    OpenStruct.new(code: '003', name: 'Kids T-shirt', price: 19.95)
  end
end

module MockDiscountItem
  def self.heart
    OpenStruct.new(code: '001', name: 'Lavender heart', price: 8.50)
  end

  def self.cufflinks
    OpenStruct.new(code: '002', name: 'Personalised cufflinks', price: 25.00)
  end

  def self.kids_tshirt
    OpenStruct.new(code: '003', name: 'Kids T-shirt', price: 12.75)
  end
end
