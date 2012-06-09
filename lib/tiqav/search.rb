
module Tiqav
  def self.search(word)
    uri = URI.parse "http://tiqav.com/search/#{URI.encode word}"
    res = Net::HTTP.start(uri.host, uri.port).request(Net::HTTP::Get.new uri.path)
    raise Error, "HTTP Status #{res.code} at #{uri}" unless res.code.to_i == 200
    doc = Nokogiri::HTML res.body
    doc.xpath('//a').map{|a|
      a['href']
    }.reject{|a|
      !(a =~ /^\/[a-zA-Z0-9]+$/)
    }.map{|a|
      Tiqav::Image.new a.scan(/([a-zA-Z0-9]+)/)[0][0]
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
