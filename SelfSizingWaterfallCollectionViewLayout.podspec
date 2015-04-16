Pod::Spec.new do |s|

  s.name         = "SelfSizingWaterfallCollectionViewLayout"
  s.version      = "0.0.1"
  s.summary      = "https://github.com/adamwaite/SelfSizingWaterfallCollectionViewLayout"

  s.description  = <<-DESC
SelfSizingWaterfallCollectionViewLayout is a UICollectionViewLayout subclass that organizes items of dynamic height into a grid of variable columnns. Items flow from one row or column to the next, with each item being placed beneath the shortest column in the section (as if you're winning at Tetris upside-down). It supports multiple sections, headers and footers. It's designed to be used alongside AutoLayout and self-sizing cell technologies introduced in iOS8.

DESC

  s.homepage     = "https://github.com/adamwaite/SelfSizingWaterfallCollectionViewLayout"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Adam Waite" => "adam@adamjwaite.co.uk" }
  s.social_media_url = "http://twitter.com/AdamWaite"

  s.platform     = :ios
  s.platform     = :ios, '6.0'

  s.source       = { :git => "https://github.com/adamwaite/SelfSizingWaterfallCollectionViewLayout.git", :tag => "v0.0.1" }
  s.source_files  = 'SelfSizingWaterfallCollectionViewLayout', 'SelfSizingWaterfallCollectionViewLayout/**/*.{h,m}'
  s.public_header_files = 'SelfSizingWaterfallCollectionViewLayout/SelfSizingWaterfallCollectionViewLayout.h'

  s.requires_arc = true

end
