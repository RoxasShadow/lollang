module LOLLang

class Token
  attr_accessor :token, :value

  def initialize(token, value = nil)
    @token = token
    @value = value
  end

  def to_s
    "#<Tokens(#{Tokens.constant_by_value @token}): #{@value}>"
  end
end

end