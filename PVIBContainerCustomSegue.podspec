Pod::Spec.new do |s|
  s.name         			= "PVIBContainerCustomSegue"
  s.version      			= "1.0.0"
  s.summary      			= "PVIBContainerCustomSegue is a custom segue for manage children view controller in Interface builder."
  s.homepage     			= "https://github.com/PavelVilbik/PVIBContainerCustomSegue"
  s.license      			= { :type => "MIT", :file => "LICENSE" }
  s.authors            		= { "Pavel Vilbik" => "p.vilbik@softteco.com" }
  s.social_media_url   		= "https://twitter.com/VitaytII"
  s.ios.deployment_target 	= '8.0'
  s.source       			= { :git => "https://github.com/PavelVilbik/PVIBContainerCustomSegue.git", :tag => "v1.0.0" }
  s.source_files  			= 'Classes/**/*.{h,m}'
  s.framework  			= 'UIKit'
  s.requires_arc 			= true
end
