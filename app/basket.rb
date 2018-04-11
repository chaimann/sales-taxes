# frozen_string_literal: true

class Basket
  attr_reader :items

  def initialize(*items)
    @items = items
  end

  def taxes
    @items.sum(&:taxes)
  end

  def total
    @items.sum(&:price_with_tax)
  end
end
