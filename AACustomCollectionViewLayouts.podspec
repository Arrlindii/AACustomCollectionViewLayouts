Pod::Spec.new do |s|
  s.name             = 'AACustomCollectionViewLayouts'
  s.version          = '0.4.0'
  s.summary          = 'Custom CollectionView Layouts'
 
  s.description      = <<-DESC 
                          Cool Custom CollectionView Layouts For iOS
                       DESC
 
  s.homepage         = 'https://github.com/Arrlindii/AACustomCollectionViewLayouts/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Arlind Aliu>' => '<arrlindii@gmail.com>' }
  s.source           = { :git => 'https://github.com/Arrlindii/AACustomCollectionViewLayouts.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'AACustomCollectionViewLayouts/CustomLayouts/*.swift',
                    'AACustomCollectionViewLayouts/LayoutGroups/*.swift',
                     'AACustomCollectionViewLayouts/AACustomLayout+Extensions.swift'
 
end
