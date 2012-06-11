# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)
require 'tmpdir'

class TestTiqavSearch < Test::Unit::TestCase

  def test_search
    assert Tiqav.search('ちくわ').size > 0
  end

  def test_random
    r = Tiqav.random
    assert r.class == Tiqav::Image
    assert r.id =~ /^[a-zA-Z0-9]+$/
  end

  def test_feelinkg_lucky
    assert Tiqav.feeling_lucky('ちくわ').kind_of? Addressable::URI
  end

end
