#
# Be sure to run `pod lib lint MKIPorter.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MKIPorter"
  s.version          = "0.1.0"
  s.summary          = "Gets you a random free TCP Port using C APIs"
  # s.description      = <<-DESC
  #                      An optional longer description of MKIPorter

  #                      * Markdown format.
  #                      * Don't worry about the indent, we strip it!
  #                      DESC
  s.homepage         = "https://github.com/kimar/MKIPorter"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Marcus Kida" => "marcus@kida.io" }
  s.source           = { :git => "https://github.com/kimar/MKIPorter.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kidmar'

  s.platform     = :ios, '2.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'MKIPorter' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
