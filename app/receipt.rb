# frozen_string_literal: true

class Receipt
  RECEIPT_TEMPLATE =
    <<~RCPT
      %{items}
      Sales Taxes: %{tax}
      Total: %{total}
    RCPT

  def initialize(basket)
    @basket = basket
  end

  def print
    RECEIPT_TEMPLATE %
      {
        items: @basket.items.map(&:to_s).join("\n"),
        tax: "%.02f" % @basket.taxes,
        total: "%.02f" %  @basket.total
      }
  end
end
