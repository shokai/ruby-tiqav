# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)
require 'tmpdir'

class TestTiqavRandom < Test::Unit::TestCase

  def setup
    @img = Tiqav.random
  end

  def test_image_class
    assert @img.class == Tiqav::Image
  end

end
