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
    notify_owner_for_upgrade
  end

  protected
  def notify_owner_for_activation
  end

  def notify_owner_for_upgrade
  end
end
