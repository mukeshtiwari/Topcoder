#! /usr/bin/env ruby

require_relative "MoreSquares"

require "gettc/types"
include Gettc

def init
  gettc_home = File.expand_path(ENV["GETTC_HOME"] || File.join(ENV["HOME"], ".gettc"))
  $LOAD_PATH << File.join(gettc_home, "include", "ruby")
  require "topcoder"
  include TopCoder
end

def main
  reader = Reader.new(IO.read(ARGV[0]))
  N = reader.next(TInt)
  reader.next()
  SX = reader.next(TInt)
  reader.next()
  SY = reader.next(TInt)
  reader.next()
  Xprefix = reader.next(TArray.new(TInt))
  reader.next()
  Yprefix = reader.next(TArray.new(TInt))

  result = MoreSquares.new().countLocations(N, SX, SY, Xprefix, Yprefix)
  IO.write(ARGV[1], Writer.new.next(result, TInt).to_s)
end

init
main
