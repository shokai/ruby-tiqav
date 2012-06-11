# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)
require 'tmpdir'

class TestTiqavImage < Test::Unit::TestCase

  def setup
    @img = Tiqav::Image.new '3om'
  end

  def test_image_class
    assert @img.class == Tiqav::Image
  end

  def test_image_exists?
    assert @img.exists?
  end

  def test_image_url
    assert @img.url.kind_of? URI::HTTP
  end

  def test_image_permalink
    assert @img.permalink.kind_of? URI::HTTP
  end

  def test_image_filename
    assert @img.filename =~ /^.+\.#{@img.ext}$/
  end

  def test_image_save
    Dir.mktmpdir do |dir|
      fpath = File.expand_path @img.filename, dir
      @img.save(fpath)
      assert File.exists?(fpath)
      assert File.stat(fpath).size > 0
    end
  end

end