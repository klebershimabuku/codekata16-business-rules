class Order
  def initialize(product)
    @product = product
  end

  def process!
    @product.process!
  end
end
