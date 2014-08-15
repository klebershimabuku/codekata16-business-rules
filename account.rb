class Account
  attr_reader :membership, :status

  def initialize
    @membership = Membership.new
    @status = 'inactive'
  end
end
