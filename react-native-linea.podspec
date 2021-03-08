require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-linea"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = package['description']
  s.homepage     = "https://github.com/el-angel/react-native-linea"
  s.license      = package['license']
  s.author       = package['author']
  s.platforms    = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "https://github.com/el-angel/react-native-linea.git", :branch => 'master' }

  s.source_files = "DTDevices.h", "react-native-linea/*.{h,m}"

  s.dependency "React-Core"
end