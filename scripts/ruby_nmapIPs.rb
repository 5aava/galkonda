
require 'socket'
require 'colorize'


begin
  file = File.open(ARGV[0], "r")
rescue
  puts "Usage: ruby getIPs.rb wordlist"
  exit
end

file.each_line do |ip|
  puts "#{ip}"
  system("nmap -p- -sT -A -oG ./nmapIPout.txt -iL ./uniqIPs.txt -Pn #{ip}") unless ip.eql?("unknown")
end

