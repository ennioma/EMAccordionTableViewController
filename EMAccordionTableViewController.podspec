Pod::Spec.new do |s|
  s.name         = 'EMAccordionTableViewController'
  s.version      = '0.1'
  s.summary      = 'EMAccordionTableViewController is a Expandable / Collapsable UITableView.'
  s.homepage     = 'https://github.com/ennioma/EMAccordionTableViewController'
  s.license      = { :type => 'APACHE',
                     :file => 'LICENSE' }
  s.author       = { 'Ennio Masi' => 'ennio.masi@gmail.com' }
  s.source       = { :git => 'https://github.com/ennioma/EMAccordionTableViewController.git',
                     :tag => '0.1' }
  s.platform     = :ios, '6.0'
  s.source_files = 'EMAccordionTableViewController/EMAccordionTableViewController/EMAccordionTableViewController/Classes/EMAccordionTable', '*.{h,m}'
  s.frameworks   = 'UIKit', 'CoreGraphics', 'QuartzCore'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/ennioma'
end
