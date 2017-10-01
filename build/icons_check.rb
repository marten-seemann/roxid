#!/usr/bin/env ruby

input = ARGF.read

value = ""
line = input
# input.each do |line|
values = line.scan /\[\{\$oViewConf->getRoxidIcon\('(.*?)'\)\}\]/

values.each do |value|
  value = value[0]
  if File.readlines("modules/roxid/icon_config.php").grep(/'#{value}'/).size > 0
    puts "#{value}: exists"
  else
    puts "#{value}: ERROR"
  end
end
