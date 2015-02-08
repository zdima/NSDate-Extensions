Pod::Spec.new do |s|
  s.name     = 'NSDate-Extensions'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'Practical real-world dates.'
  s.homepage = 'http://ericasadun.com'
  s.author   = { 'Erica Sadun' => 'erica@ericasadun.com', 'Dmitriy Zakharkin' => 'mail@zdima.net' }
  s.source   = { :git => 'https://github.com/zdima/NSDate-Extensions.git', :commit => '508e484dc44e1db90fe30ef4dc3d616f70c6fe66' }
  s.source_files = 'NSDate+Utilities.{h,m}', 'NSDate+Epoch.{h,m}'
  s.framework = 'Foundation'

  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
end

