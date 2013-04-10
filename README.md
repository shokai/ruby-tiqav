tiqav
=====
ruby wrapper for [tiqav.com](http://tiqav.com)

* https://github.com/shokai/ruby-tiqav
* https://rubygems.org/gems/tiqav


Installation
------------

    % gem install tiqav


Usage
-----

```ruby
require 'rubygems'
require 'tiqav'
images = Tiqav.search 'ちくわ'

images.each do |img|
  puts "(id:#{img.id}) #{img.permalink} => #{img.url}"
  img.save(img.filename)
  puts "saved!! => #{img.filename}"
end
```

```ruby
img = Tiqav.random
puts img.url
puts img.thumbnail
puts img.glitch

puts Tiqav.feeling_lucky 'ちくわ'
```


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
