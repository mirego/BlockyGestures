Pod::Spec.new do |spec|
  spec.name = "BlockyGestures"
  spec.version = "1.0.0"
  spec.summary = "A small framework written in Swift that adds closures to UIGestureRecognizer"
  spec.homepage = "https://github.com/lordzsolt/BlockyGestures"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Zsolt Kovacs" => 'zsolt@iosmith.com' }

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/lordzsolt/BlockyGestures.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "BlockyGestures/**/*.{h,swift}"
end