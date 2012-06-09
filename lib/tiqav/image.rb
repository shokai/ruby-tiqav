
module Tiqav

  class Image
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def permalink
      "http://tiqav.com/#{@id}"
    end

    def filename
      "#{@id}.jpg"
    end

    def url
      "http://tiqav.com/#{filename}"
    end

    def save(fname)
      uri = URI.parse url
      res = Net::HTTP.start(uri.host, uri.port).
        request(Net::HTTP::Get.new uri.path)
      unless res.code.to_i == 200          
        raise Error, "HTTP Status #{res.code} - #{url}"
      end
      open(fname,'w+') do |f|
        f.write res.body
      end
      fname
    end

    def exists?
      uri = URI.parse url
      case code = Net::HTTP.start(uri.host, uri.port).
          request(Net::HTTP::Head.new uri.path).
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
