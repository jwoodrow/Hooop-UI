Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '9.0'
s.swift_version = '3.2'
s.name = "HooopUI"
s.summary = "UI Classes and extensions used in the Hooop applications"
s.requires_arc = true

s.version = "0.0.11"

s.license = { :type => 'All rights reserved.', :text => <<-LICENSE
Copyright (C) HOOOP, Inc - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by James Woodrow <james@hooop.fr>, March 2018
LICENSE
}

s.author = { "James Woodrow" => "james@hooop.fr" }

s.homepage = "https://github.com/jwoodrow/HooopUI"

s.source = { :git => "https://github.com/jwoodrow/HooopUI.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "HooopUI/**/*.{swift}"

end
