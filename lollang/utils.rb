class String
  def alpha?
    !!match(/^[[:alpha:]]+$/)
  end

  def alnum?
    !!match(/^[[:alnum:]]+$/)
  end

  def numeric?
    true if Float(self) rescue false
  end

  def newline?
    self == "\n" || self == "\r"
  end
end

class BasicObject
  def constant_by_value(val)
    constants.find { |name| const_get(name) == val }
  end
end