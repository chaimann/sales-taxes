# frozen_string_literal: true

class Item
  extend Forwardable

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def price_with_tax
    @product.price_with_tax * @quantity
  end

  def taxes
    @product.taxes * @quantity
  end

  def to_s
    "#{@quantity}, #{@product.name}, #{"%.02f" % price_with_tax}"
  end
end
