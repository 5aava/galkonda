
require 'socket'
require 'colorize'


begin
  file = File.open(ARGV[0], "r")
rescue
  puts "Usage: ruby getIPs.rb wordlist"
  exit
end

file.each_line do |subdomain|
  begin
    ip = IPSocket::getaddress(subdomain.strip)
  rescue
    ip = "unknown"
  end  
  puts "#{ip}"
end

