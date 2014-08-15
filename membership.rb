class Membership
  def initialize
    @status = 'inactive'
  end

  def process!
    activate
  end

  def active?
    @status == 'activated'
  end

  protected
  def activate
    @status = 'activated'
  end
end
