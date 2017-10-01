#!/usr/bin/ruby

# generates the install SQL command for the ROXID values of the oxconfig table
# to do so a file containing the *complete* SQL export of the oxconfig table has to be provided as command line argument

require 'pathname'

file = Pathname.new ARGV[0]

index = 0
File.open(file).each do |line|
  if line.include? "INSERT"
    puts line
  end
  if line.include? "theme:roxid"
    if index > 0 then puts ", " end
    index += 1
    parts = line[line.index("(")+1...line.rindex(")")].split(", ")
    parts[-1] = "CURRENT_TIMESTAMP()"
    cfgname = parts[3][1...-1] # e.g. "sDefaultListDisplayType"
    parts[0]="'roxid.#{cfgname}'" # set a meaningful OXID for this entry
    print "(" + parts.join(", ") + ")"
  end
end

puts ""
puts ";"
