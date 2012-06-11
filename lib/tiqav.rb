$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'tiqav/tiqav'
require 'tiqav/image'
require 'tiqav/search'
require 'tiqav/alpha_num'

module Tiqav
  VERSION = '0.0.2'
end
