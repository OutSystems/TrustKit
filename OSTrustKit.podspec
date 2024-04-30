Pod::Spec.new do |s|
  s.name         = 'OSTrustKit'
  s.version      = '1.6.0+1.0.0'
  s.summary      = 'OSTrustKit is an open source framework that makes it easy to deploy SSL pinning in any iOS.'
  s.homepage     = 'https://github.com/Outsystems/TrustKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = 'Outsystems'
  s.source       = { :http => "https://github.com/OutSystems/TrustKit/releases/download/#{s.version}/OSTrustKit.zip", :type => "zip" }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  s.vendored_frameworks = 'OSTrustKit.zip/OSTrustKit.xcframework'
end
