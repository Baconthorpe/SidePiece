Pod::Spec.new do |s|
  s.name             = 'SidePiece'
  s.version          = '0.1'
  s.summary          = 'SidePiece is a simple iOS framework for displaying an animated menu appearing from the side of the screen.'

  s.description      = <<-DESC
SidePiece is a simple iOS framework for displaying an animated menu appearing from the side of the screen.
                       DESC

  s.homepage         = 'https://github.com/Baconthorpe/SidePiece'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ezekiel Abuhoff' => 'zabuhoff@gmail.com' }
  s.source           = { :git => 'https://github.com/Baconthorpe/SidePiece.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'SidePiece/*.{swift,plist,h}'

end
