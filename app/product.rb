# frozen_string_literal: true

class Product
  attr_reader :name, :price

  def initialize(name, price, options = {})
    @name = name
    @price = price
    @tax_exempt = options[:tax_exempt] || false
    @import = options[:import] || false
  end

  def price_with_tax
    price + taxes
  end

  def taxes
    (price * tax_rate * 20).ceil / 20.0
  end

  def tax_rate
    rate = 0
    rate += 0.1 unless @tax_exempt
    rate += 0.05 if @import
    rate
  end
end
