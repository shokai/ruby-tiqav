
module Tiqav
  def self.search(word)
    uri = URI.parse "http://api.tiqav.com/search.json?q=#{URI.encode word}"
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

end
