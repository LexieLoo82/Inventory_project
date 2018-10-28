require("minitest/autorun")
require_relative("../product")

class TestSupplier < MiniTest::Test

  def setup
    options ={
      "id" => "1",
      "name" => "Bees Wax Wraps",
      "type" => "kitchen",
      "quantity" => 0,
      "cost_price" => 10,
      "sell_price" => 25,
      "supplier_id" => 5}
      @product = Product.new(options)
    end

    def test_quantity()
      assert_equal(5, @product.quantity)
    end

    def test_name()
      result = @product.name()
      assert_equal("Bees Wax Wraps", result)
    end

    def test_sell_product()
      assert_equal(4, @product.sell_product)
    end


    def test_low_stock()
      assert_equal("Out of Stock!", @product.low_stock)
    end

  end
