
class AlphaNum
  def self.table
    @@table ||= '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')
  end

  def self.encode(num)
    num > 61 ? self.encode(num/62)+self.table[num%62] : self.table[num%62]
  end

  def self.decode(str)
    arr = str.split('').map{|i| self.table.index i }
    for i in 0...arr.size do
      return arr[i] if i == arr.size-1
      arr[i+1] += arr[i]*62
    end
  end
end


if __FILE__ == $0
  puts AlphaNum.decode 'Ab'
  puts AlphaNum.encode 365
end
