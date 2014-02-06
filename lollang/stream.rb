module LOLLang

class Stream
  def initialize(way = :tty, file = '')
    @way    = way
    @stream = way == :tty ? StringIO.new : StringIO.new(File.read(file))
  end

  def getc
    @stream.ungetc STDIN.getc if @way == :tty
    @stream.getc
  end

  def eof?
    @way == :tty ? false : @stream.eof?
  end

  def method_missing(m, *args, &block)
    @stream.send m
  end
end

end