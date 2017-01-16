require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ParseWeapons
  uri = 'http://www.crunchy.com/?q=wiki/' + "wildfire-equipment"
  doc = Nokogiri::HTML(open(uri))
  puts doc.keys
end
