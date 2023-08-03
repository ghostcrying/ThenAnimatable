Pod::Spec.new do |s|
  s.name             = 'ThenAnimatable'
  s.version          = '0.0.1'
  s.summary          = 'Design and prototype UI, interaction, navigation, transition and animation for App Store ready Apps in Interface Builder with ThenAnimatable.
    Fork from IBAnimatable'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage      = 'https://github.com/ghostcrying/ThenAnimatable'
  # s.screenshots = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author        = { 'ghost' => 'czios1501@gmail.com' }
  s.source        = { :git => "https://github.com/ghostcrying/ThenAnimatable.git", :tag => s.version }
  
  s.platform      = :ios, "11.0"
  s.swift_version = "5.0"

  s.source_files  = 'Sources/**/*.swift'
  s.frameworks    = 'Foundation', 'UIKit'
  
end

