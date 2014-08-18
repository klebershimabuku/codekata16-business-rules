class Order
  attr_accessor :packing_slip

  def initialize(item, *actions)
    @item = item
    @actions = actions
    @packing_slip = []
  end

  def process!
    @item.process!(@actions)
  end
end
