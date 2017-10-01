#!/usr/bin/env ruby
require 'pathname'

file = Pathname.new ARGV[0]
license_file = Pathname.new ARGV[1]

inserted = false
f = File.open(file)
f.each do |line|
  puts line
  if line.include? "<?php" and !inserted
    inserted = true
    puts File.open(license_file, "rb") { |io| io.read }
    puts ""
  end
end
f.close()

