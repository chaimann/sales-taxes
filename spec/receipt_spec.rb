# frozen_string_literal: true

describe Receipt do
  describe "#print" do
    let(:basket) { Basket.new(*items) }
    let(:receipt) { Receipt.new(basket) }

    describe "INPUT 1" do
      let(:output) do
        <<~RECEIPT
        1, book, 12.49
        1, music CD, 16.49
        1, chocolate bar, 0.85
        Sales Taxes: 1.50
        Total: 29.83
        RECEIPT
      end
      let(:book) { Product.new("book", 12.49, tax_exempt: true) }
      let(:cd) { Product.new("music CD", 14.99) }
      let(:chocolate) { Product.new("chocolate bar", 0.85, tax_exempt: true) }
      let(:items) { [Item.new(book, 1), Item.new(cd, 1), Item.new(chocolate, 1)] }

      it "prints correct output" do
        expect(receipt.print).to eq(output)
      end
    end

    describe "INPUT 1 w/quantity" do
      let(:output) do
        <<~RECEIPT
        2, book, 24.98
        3, music CD, 49.47
        1, chocolate bar, 0.85
        Sales Taxes: 4.50
        Total: 75.30
        RECEIPT
      end
      let(:book) { Product.new("book", 12.49, tax_exempt: true) }
      let(:cd) { Product.new("music CD", 14.99) }
      let(:chocolate) { Product.new("chocolate bar", 0.85, tax_exempt: true) }
      let(:items) { [Item.new(book, 2), Item.new(cd, 3), Item.new(chocolate, 1)] }

      it "prints correct output" do
        expect(receipt.print).to eq(output)
      end
    end

    describe "INPUT 2" do
      let(:output) do
        <<~RECEIPT
        1, imported box of chocolates, 10.50
        1, imported bottle of perfume, 54.65
        Sales Taxes: 7.65
        Total: 65.15
        RECEIPT
      end
      let(:chocolates) { Product.new("imported box of chocolates", 10.00, import: true, tax_exempt: true) }
      let(:perfume) { Product.new("imported bottle of perfume", 47.50, import: true) }
      let(:items) { [Item.new(chocolates, 1), Item.new(perfume, 1)] }

      it "prints correct output" do
        expect(receipt.print).to eq(output)
      end
    end

    describe "INPUT 3" do
      let(:output) do
        <<~RECEIPT
          1, imported bottle of perfume, 32.19
          1, bottle of perfume, 20.89
          1, packet of headache pills, 9.75
          1, imported box of chocolates, 11.85
          Sales Taxes: 6.70
          Total: 74.68
        RECEIPT
      end
      let(:imp_perfume) { Product.new("imported bottle of perfume", 27.99, import: true) }
      let(:perfume) { Product.new("bottle of perfume", 18.99) }
      let(:pills) { Product.new("packet of headache pills", 9.75, tax_exempt: true) }
      let(:chocolates) { Product.new("imported box of chocolates", 11.25, import: true, tax_exempt: true) }
      let(:items) { [Item.new(imp_perfume, 1), Item.new(perfume, 1), Item.new(pills, 1), Item.new(chocolates, 1)] }

      it "prints correct output" do
        expect(receipt.print).to eq(output)
      end
    end
  end
end
