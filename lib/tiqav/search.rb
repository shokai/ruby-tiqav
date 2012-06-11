
module Tiqav
  def self.search(word)
    uri = Addressable::URI.parse "http://api.tiqav.com/search.json?q=#{Addressable::URI.encode word}"
    res = Net::HTTP.start(uri.host, uri.port).request(Net::HTTP::Get.new uri.request_uri)
    raise Error, "HTTP Status #{res.code} at #{uri}" unless res.code.to_i == 200
    JSON.parse(res.body).map{|img|
      Tiqav::Image.new img['id'], img['ext']
    }
  end

  def self.random
    loop do
      res = Image.new AlphaNum.encode rand 10000
      return res if res.exists?
      sleep 1
    end
  end

  def self.feeling_lucky(word)
    Addressable::URI.parse "http://#{word}.tiqav.com/"
  end

end
