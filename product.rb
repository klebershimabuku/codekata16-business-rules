class Product
  def process!(*actions)
    actions.flatten.each do |action|
      self.send(action.to_sym)
    end
  end
end
