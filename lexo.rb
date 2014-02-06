require_relative 'lollang/lollang'
include LOLLang

puts 'Starting LOLLang\'s wizardries...'

stream = ARGV.any? ? Stream.new(:file, ARGV.first) : Stream.new(:tty)

loop {
  token = Lexer.get_tok stream

  puts "> #{token}" if token.is_a?(Token) || !token.strip.empty?

  break if token.is_a?(Token) && token.token == Tokens::TOK_EOF
}

stream.close

puts 'The end.'