require './product'

class PhysicalProduct < Product
  def process!
    generate_packing_slip
    generate_comission_payment
  end

  protected
  def generate_packing_slip
    true
  end

  def generate_comission_payment
    true
  end
end
