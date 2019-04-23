#! /usr/bin/env ruby

require_relative "OneHandScheduling"

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
  tStart = reader.next(TArray.new(TInt))
  reader.next()
  tEnd = reader.next(TArray.new(TInt))

  result = OneHandScheduling.new().checkSchedule(tStart, tEnd)
  IO.write(ARGV[1], Writer.new.next(result, TString).to_s)
end

init
main
