Pod::Spec.new do |s|

s.platform = :ios
s.name = "HooopUI"
s.summary = "UI Classes and extensions used in the Hooop applications"
s.requires_arc = true

s.version = "0.0.1"

s.license = "All rights reserved"

s.author = { "James Woodrow" => "james@hooop.fr" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/jwoodrow/HooopUI"


s.source = { :git => "https://github.com/jwoodrow/HooopUI.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "HooopUI/**/*.{swift}"

s.resources = "HooopUI/**/*.{png,jpeg,jpg,storyboard,xib}"

end
