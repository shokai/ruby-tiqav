require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestAlphaNum < MiniTest::Unit::TestCase

  def test_encode
    assert Tiqav::AlphaNum.encode(365) == '5T'
  end

  def test_decode
    assert Tiqav::AlphaNum.decode('Ab') == 2243
  end

  def test_encode_decode
    assert Tiqav::AlphaNum.decode(Tiqav::AlphaNum.encode(1024)) == 1024
  end

  def test_decode_encode
    assert Tiqav::AlphaNum.encode(Tiqav::AlphaNum.decode('AxCY53Ef')) == 'AxCY53Ef'
  end

end
