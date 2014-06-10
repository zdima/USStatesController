Pod::Spec.new do |s|
  s.name         = 'USStatesController'
  s.version      = '0.0.1'
  s.license      =  'MIT'
  s.homepage     = 'httpis://github.com/zdima/USStatesController'
  s.authors      = { "Dmitriy Zakharkin" => "mail@zdima.net" }
  s.summary      = 'Provide NSArrayController with content set to US States'

  s.osx.deployment_target = "10.8"
  s.source       = { :git => "https://github.com/zdima/USStatesController.git", :commit => "ed811f05f7c64995f3816b4cfe12994251026b45" }
  s.source_files  = "USStatesController/**/*.{h,m}"
  s.public_header_files = "USStatesController/*.h"
  s.resource  = "USStatesController/USStateAbbreviations.plist"
  s.requires_arc = true
  
end
