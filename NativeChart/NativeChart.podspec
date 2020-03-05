require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "NativeChart"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  charts for react native
                   DESC
  s.homepage     = "https://github.com/HenryQuan/native-chart-experiment"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Yiheng Quan" => "development.henryquan@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/HenryQuan/native-chart-experiment.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.swift_version = '5.0'
  s.dependency "React"
  s.dependency "Charts"
end

