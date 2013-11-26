Pod::Spec.new do |s|
  s.name         = 'TAG'
  s.version      = '0.1'
  s.license      =  :type => '<#License#>'
  s.homepage     = '<#Homepage URL#>'
  s.authors      =  '<#Author Name#>' => '<#Author Email#>'
  s.summary      = '<#Summary (Up to 140 characters#>'

# Source Info
  s.platform     =  :ios, '<#iOS Platform#>'
  s.source       =  :git => '<#Github Repo URL#>', :tag => '<#Tag name#>'
  s.source_files = '<#Resources#>'
  s.framework    =  '<#Required Frameworks#>'

  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'HLLFont', '~> 0.1'
  s.dependencies =	pod 'ViewDeck', '= 2.2.11'
  s.dependencies =	pod 'GMGridView', '~> 1.1.1'
  s.dependencies =	pod 'SVPullToRefresh', '~> 0.4.1'
  s.dependencies =	pod 'SDWebImage', '~> 3.4'
  s.dependencies =	pod 'MBProgressHUD', '~> 0.8'
  s.dependencies =	pod 'OHAttributedLabel', '~> 3.5.3'
  s.dependencies =	pod 'JSONModel', '~> 0.9.3'
  s.dependencies =	pod 'CocoaSecurity', '~> 1.2.1'
  s.dependencies =	pod 'KeychainItemWrapper', '~> 1.2'
  s.dependencies =	pod 'RegexKitLite', '~> 4.0'
  s.dependencies =	pod 'Analytics', '~> 0.7.5'
  s.dependencies =	pod 'TestFlightSDK', '~> 2.1.1-beta'

end