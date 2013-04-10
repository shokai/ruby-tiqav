#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'rubygems'
require 'tiqav'

search_word = ARGV.empty? ? 'ちくわ' : ARGV.first

images =  Tiqav.search search_word
images.each do |img|
  puts "#{img.permalink} => #{img.url}"
end
puts "#{images.size} results"

puts "search word : #{search_word}"
