require './product'

class Membership < Product
  attr_reader :plan

  def initialize
    @status = 'inactive'
    @plan = :free
  end

  def active?
    @status == 'activated'
  end

  def activate_membership
    @status = 'activated'
  end

  def upgrade_membership
    @plan = :premium if @plan = :free
  end
end
