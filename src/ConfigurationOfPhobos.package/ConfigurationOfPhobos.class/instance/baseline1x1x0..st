baselines
baseline1x1x0: spec
  
	<version: '1.1.0-baseline'>
	
	spec for: #'pharo3.0.x' do: [
		spec 
			blessing: #baseline;
			repository: 'http://smalltalkhub.com/mc/PavelKrivanek/Phobos/main'.
			
		spec project: 'ZincHTTPComponents' with: [
			spec repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
			spec className: 'ConfigurationOfZincHTTPComponents'.
			spec file: 'ConfigurationOfZincHTTPComponents'.
			spec loads: #('Zinc-WebSocket-Core')].
					
		spec project: 'OSProcess' with: [ 
			spec repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/'.
			spec className: 'ConfigurationOfOSProcess'.
			spec loads: #('Core with Output') ].		
					
		spec package: 'JSON' with: [
			spec repository: 'http://smalltalkhub.com/mc/PharoExtras/SCouchDBViewServer/main'].
			
		spec package: 'Phobos-Core' with: [spec requires: #('ZincHTTPComponents' 'JSON') ].
		spec package: 'Phobos-XUL' with: [spec requires: #('Phobos-Core') ].
		spec package: 'Phobos-HTML' with: [spec requires: #('Phobos-Core') ].
		spec package: 'Phobos-Demo' with: [spec requires: #('Phobos-XUL' 'Phobos-HTML' 'OSProcess') ].
			
		spec group: 'default' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML' 'Phobos-Demo').
		spec group: 'demo' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML' 'Phobos-Demo').
		spec group: 'core' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML').
		
		spec postLoadDoIt: #'postload1x1x0:package:'.

	].
      
        
