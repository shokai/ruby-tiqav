
module Tiqav

  class Image
    attr_reader :id, :url, :permalink, :filename, :ext

    def initialize(id, ext = 'jpg')
      @id = id
      @ext = ext
      @filename = "#{@id}.#{@ext}"
      @url = URI.parse "http://img.tiqav.com/#{@filename}"
      @permalink = URI.parse "http://tiqav.com/#{@id}"
    end

    def save(fname)
      res = Net::HTTP.start(url.host, url.port).
        request(Net::HTTP::Get.new url.path)
      unless res.code.to_i == 200          
        raise Error, "HTTP Status #{res.code} - #{url}"
      end
      open(fname,'w+') do |f|
        f.write res.body
      end
      fname
    end

    def exists?
      case code = Net::HTTP.start(url.host, url.port).
          request(Net::HTTP::Head.new url.path).
          code.to_i
        when 200
        return true
        when 404
        return false
      end
      raise Error, "HTTP Status #{code} - Bad Response from #{url}"
    end
  end

end
