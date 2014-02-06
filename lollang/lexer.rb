module LOLLang

module Lexer
  include Tokens

  def self.get_tok(stream)
    last_char = ' '
    last_char = stream.getc while last_char == ' '

    if last_char.alpha?
      identifier_str  = last_char
      identifier_str += last_char while (last_char = stream.getc).alnum?

      return Token.new case identifier_str
        when 'def'    then TOK_DEF
        when 'extern' then TOK_EXTERN
        else               TOK_IDENTIFIER
      end, identifier_str
    end

    if last_char.numeric? || last_char == ?.
      num = 0.0
      loop {
        num      += last_char.to_f
        last_char = stream.getc
        break if !last_char.numeric? || last_char != ?.
      }

      return Token.new TOK_NUMBER, num
    end

    if last_char == ?#
      loop {
        last_char = stream.getc
        break if stream.eof? || last_char.newline?
      }

      return get_tok(stream) unless stream.eof?
    end

    return Token.new(TOK_EOF) if stream.eof?
    return last_char
    # this_char = last_char
    # last_char = stream.getc
    # this_char
  end
end

end