Pod::Spec.new do |spec|
  spec.name = 'BlockyGestures'
  spec.version = '1.0.0'
  spec.summary = 'A small framework written in Swift that adds closures to UIGestureRecognizer'
  spec.homepage = 'https://github.com/mirego/BlockyGestures'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { 'Zsolt Kovacs' => 'zsolt@iosmith.com' }

  spec.ios.deployment_target = '8.0'
  spec.tvos.deployment_target = '9.0'
  spec.requires_arc = true
  spec.source = { :git => 'https://github.com/mirego/BlockyGestures.git', :tag => spec.version }
  spec.source_files = 'BlockyGestures/**/*.{h,swift}'
end