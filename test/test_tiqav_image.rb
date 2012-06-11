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

  def test_image_thumbnail
    assert @img.thumbnail.kind_of? URI::HTTP
    res = Net::HTTP.start(@img.thumbnail.host, @img.thumbnail.port).
      request(Net::HTTP::Head.new @img.thumbnail.path)
    assert res.code.to_i == 200
  end

  def test_image_glitch
    assert @img.glitch.kind_of? URI::HTTP
    res = Net::HTTP.start(@img.glitch.host, @img.glitch.port).
      request(Net::HTTP::Head.new @img.glitch.path)
    assert res.code.to_i == 200
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
