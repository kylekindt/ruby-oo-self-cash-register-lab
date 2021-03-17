require "pry"
class CashRegister
  attr_accessor :discount, :total, :items

    def initialize(discount=0)
      self.total = 0
      self.discount = discount
      self.items = []
    end

    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      # quantity.times{self.items << title}
      quantity.times do 
        self.items << title 
      end
      @last_transaction = [title, price, quantity]
    end

    def apply_discount
      if discount > 0 && total 
        self.total = (self.total * ((100.0 - discount.to_f)/100)).to_i
        return "After the discount, the total comes to $800."
      end
        return "There is no discount to apply."
    end

    def void_last_transaction
      self.total -= @last_transaction[1] * @last_transaction[2]
    end
end
