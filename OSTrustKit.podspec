Pod::Spec.new do |s|
  s.name                  = 'OSTrustKit'
  s.version               = '3.0.4+1.0.0'

  s.summary               = 'OSTrustKit is an open source framework that makes it easy to deploy SSL pinning in any iOS.'

  s.homepage              = 'https://github.com/Outsystems/TrustKit'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'OutSystems Mobile Ecosystem' => 'rd.mobileecosystem.team@outsystems.com' }

  s.source                = { :http => "https://github.com/OutSystems/TrustKit/releases/download/#{s.version}/OSTrustKit.zip", :type => "zip" }
  s.vendored_frameworks   = 'OSTrustKit.xcframework'

  s.ios.deployment_target = '14.0'
  s.swift_version         = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7', '5.8', '5.9']
end