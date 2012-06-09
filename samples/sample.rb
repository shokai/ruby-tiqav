#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
$:.unshift File.expand_path 'lib', File.dirname(__FILE__)+'/../'
require 'rubygems'
require 'tiqav'

img = Tiqav::Image.new 'ae'
puts img.exists?
puts img.url

img = Tiqav.random
puts img.id
puts img.permalink
puts img.url
img.save img.filename
puts "saved!! => #{img.filename}"
