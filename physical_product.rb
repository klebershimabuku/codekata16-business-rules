require './product'

class PhysicalProduct < Product
  def process!
    generate_packing_slip
  end

  protected
  def generate_packing_slip
    true
  end
end
