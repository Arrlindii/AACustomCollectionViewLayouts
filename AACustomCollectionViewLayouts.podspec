Pod::Spec.new do |s|
  s.name             = 'AACustomCollectionViewLayouts'
  s.version          = '0.1.0'
  s.summary          = 'Custom CollectionView Layouts'
 
  s.description      = <<-DESC Custom CollectionView Layouts
                       DESC
 
  s.homepage         = 'https://github.com/Arrlindii/AACustomCollectionViewLayouts/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Arlind Aliu>' => '<arrlindii@gmail.com>' }
  s.source           = { :git => 'https://github.com/Arrlindii/AACustomCollectionViewLayouts.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'AACustomCollectionViewLayouts/AACustomCollectionViewLayouts/CustomLayouts/*.swift, 
                    AACustomCollectionViewLayouts/AACustomCollectionViewLayouts/LayoutGroups/*.swift,
                     AACustomCollectionViewLayouts/AACustomCollectionViewLayouts/AACustomLayout+Extensions.swift'
 
end