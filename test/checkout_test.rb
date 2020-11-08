require 'ostruct'
require_relative '../test_helper'
require_relative '../lib/checkout'
require_relative '../mocks/mock_items'

class CheckoutTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_scan
    co = Checkout.new
    co.scan(MockItems.heart)
    co.scan(MockItems.cufflinks)
    co.scan(MockItems.kids_tshirt)
    assert_equal 3, co.items.length
  end

  def test_total
    co = Checkout.new
    co.scan(MockItems.heart)
    co.scan(MockItems.cufflinks)
    co.scan(MockItems.kids_tshirt)
    assert_equal 74.2, co.total
  end
end
