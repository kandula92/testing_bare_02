Pod::Spec.new do |s|
  s.name             = 'TensorFlowLiteC'
  s.version          = '2.7.0'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'Apache' }
  s.homepage         = 'https://github.com/tensorflow/tensorflow'
  s.source           = { :http => "https://dl.google.com/dl/cpdc/6ffa58c2d5bbf5ff/TensorFlowLiteC-#{s.version}.tar.gz" }
  s.summary          = 'TensorFlow Lite'
  s.description      = <<-DESC

  An internal-only pod containing the TensorFlow Lite C library that the public
  `TensorFlowLiteSwift` and `TensorFlowLiteObjC` pods depend on. This pod is not
  intended to be used directly. Swift developers should use the
  `TensorFlowLiteSwift` pod and Objective-C developers should use the
  `TensorFlowLiteObjC` pod.
                       DESC

  s.ios.deployment_target = '9.0'

  s.module_name = 'TensorFlowLiteC'
  s.library = 'c++'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'Frameworks/TensorFlowLiteC.framework'
  end

  s.subspec 'CoreML' do |coreml|
    coreml.weak_framework = 'CoreML'
    coreml.dependency 'TensorFlowLiteC/Core'
    coreml.vendored_frameworks = 'Frameworks/TensorFlowLiteCCoreML.framework'
  end

  s.subspec 'Metal' do |metal|
    metal.weak_framework = 'Metal'
    metal.dependency 'TensorFlowLiteC/Core'
    metal.vendored_frameworks = 'Frameworks/TensorFlowLiteCMetal.framework'
  end
end
