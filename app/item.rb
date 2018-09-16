class Item
  attr_accessor :name, :price

  def initialize(name="unknown",price=0.0)
    @name = name
    @price = price
  end
end
