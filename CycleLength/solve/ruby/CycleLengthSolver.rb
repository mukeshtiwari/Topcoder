#! /usr/bin/env ruby

require_relative "CycleLength"

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
  seed = reader.next(TInt)
  reader.next()
  a = reader.next(TInt)
  reader.next()
  b = reader.next(TInt)
  reader.next()
  m = reader.next(TInt)

  result = CycleLength.new().solve(seed, a, b, m)
  IO.write(ARGV[1], Writer.new.next(result, TInt).to_s)
end

init
main
