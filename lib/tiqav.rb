$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'net/http'
require 'json'
require 'addressable/uri'
require 'tiqav/error'
require 'tiqav/image'
require 'tiqav/search'
require 'tiqav/alpha_num'

module Tiqav
  VERSION = '0.0.5'
end
