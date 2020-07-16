

Pod::Spec.new do |s|


  s.name         = "QTCore"
  s.version      = "0.2"
  s.summary      = "A short description of QTCore."


#s.description  = <<-DESC
#                  DESC

  s.homepage     = "https://github.com/HelloBie/QTCoreMain"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }




  s.author             = { "不不不紧张" => "1005903848@qq.com" }




  s.source       = { :git => "https://github.com/HelloBie/QTCoreMain.git", :tag => "#{s.version}" }




  s.source_files  = "QTCoreMain/QTCore/*.{h,m}"
#s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"




  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"




  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"




  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
