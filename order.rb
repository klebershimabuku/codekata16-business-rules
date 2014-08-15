class Order
  def initialize(item)
    @item = item
  end

  def process!
    @item.process!
  end
end
