# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)
require 'tmpdir'

class TestTiqavSearch < Test::Unit::TestCase

  def setup
    @imgs = Tiqav.search('ちくわ')
  end

  def test_search
    assert @imgs.size > 0
  end

end
