Pod::Spec.new do |s|
  s.name         = 'EMAccordionTableViewController'
  s.version      = '0.5.2'
  s.summary      = 'EMAccordionTableViewController is a Expandable / Collapsable UITableView.'
  s.homepage     = 'https://github.com/ennioma/EMAccordionTableViewController'
  s.license      = { :type => 'APACHE',
                     :file => 'LICENSE' }
  s.authors      = { 'Ennio Masi' => 'ennio.masi@gmail.com' }
  s.source       = { :git => 'https://github.com/ennioma/EMAccordionTableViewController.git', :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.source_files = 'EMAccordionTable/*.{h,m}', 'EMAccordionTable/UIImage+ImageEffects/*.{h,m}'
  s.ios.frameworks   = 'CoreGraphics', 'QuartzCore'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/ennioma'
end
