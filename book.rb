require './product'

class Book < Product

  def generate_packing_slip
    true
  end

  def generate_packing_slip_for_royalty_department
    true
  end

  def generate_comission_payment
    true
  end
end
