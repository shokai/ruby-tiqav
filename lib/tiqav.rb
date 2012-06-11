$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'net/http'
require 'uri'
require 'json'
require 'tiqav/error'
require 'tiqav/image'
require 'tiqav/search'
require 'tiqav/alpha_num'

module Tiqav
  VERSION = '0.0.3'
end
