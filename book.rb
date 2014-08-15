require './product'

class Book < Product
  def process!
    generate_packing_slip
    generate_packing_slip_for_royalty_department
    generate_comission_payment
  end

  protected
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
