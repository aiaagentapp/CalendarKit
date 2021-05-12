Pod::Spec.new do |s|
  s.name             = "CalendarKit"
  s.summary          = "Fully customizable calendar for iOS"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/richardtop/CalendarKit"
  s.license          = 'MIT'
  s.author           = { "Richard Topchii" => "richardtop@users.noreply.github.com" }
  s.source           = { :git => "aiaagentapp/ActiveLabel.swift", :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/richardtop'
  s.platform     = :ios, '11.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.dependency 'DateToolsSwift'
  s.dependency 'Neon'
  s.dependency 'https://github.com/aiaagentapp/ActiveLabel.swift'
end
