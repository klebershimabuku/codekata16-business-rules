require './product'

class PhysicalProduct < Product

  def generate_packing_slip
    true
  end

  def generate_comission_payment
    true
  end
end
