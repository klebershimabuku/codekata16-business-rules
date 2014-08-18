require './product'

class Video < Product
  attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end

  def add
    add_free_videos if self.title = 'Learning to Ski'
  end

  protected
  def add_free_videos
  end

end
