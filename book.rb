require './product'

class Book < Product
  def process!
    generate_packing_slip
    generate_packing_slip_for_royalty_department
  end

  protected
  def generate_packing_slip
    true
  end

  def generate_packing_slip_for_royalty_department
    true
  end
end
