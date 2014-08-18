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
    notify_owner_for_activation
  end

  def upgrade_membership
    @plan = :premium if @plan = :free
  end

  protected
  def notify_owner_for_activation
  end
end
