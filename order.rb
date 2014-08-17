class Order
  def initialize(item, *actions)
    @item = item
    @actions = actions
  end

  def process!
    @item.process!(@actions)
  end
end
