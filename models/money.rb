require('pry')

class Money

  def self.money_to_db(money)
    float = money.to_f * 100
    return float.to_i()
  end

  def self.money_to_layout(money)
    money / 100.00
  end

  def self.in_out(type, amount)
    result = nil
    if type == 'outgoing'
      result = - amount
    else
      result = amount
    end

    return result
  end

end
