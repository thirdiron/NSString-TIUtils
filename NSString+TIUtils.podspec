Pod::Spec.new do |s|

  s.name         = "NSString+TIUtils"
  s.version      = "0.1.1"
  s.summary      = "A few basic methods for simplifying working with strings."

  s.description  = <<-DESC
                   Currently has one to make pattern matching more straightforward, and to trim leading zeroes from a number.
                   DESC

  s.homepage     = "https://github.com/thirdiron/NSString-TIUtils"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Karl Becker" => "karl@thirdiron.com" }
  s.social_media_url = "http://twitter.com/karlbecker_com"

  s.platform     = :ios

  s.source       = { :git => "https://github.com/thirdiron/NSString-TIUtils.git", :tag => "0.1.1" }

  s.source_files  = 'Categories', 'Categories/**/*.{h,m}'

end
