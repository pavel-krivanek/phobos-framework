baselines
baseline1x0x0: spec
  
	<version: '1.0.0-baseline'>
	
	| seasideRepository |
	
	seasideRepository := 'http://www.squeaksource.com/Seaside30'.

	spec for: #pharo do: [
		spec 
			blessing: #baseline;
			repository: 'http://smalltalkhub.com/mc/PavelKrivanek/Phobos/main'.
			
		spec
			project: 'ZincHTTPComponents' with: [
				spec repository: 'http://www.squeaksource.com/MetacelloRepository'.
				spec className: 'ConfigurationOfZincHTTPComponents'.
				spec file: 'ConfigurationOfZincHTTPComponents'.
				spec loads: #('Zinc-HTTP' 'Zinc-FileSystem' 'Zinc-Tests' 'Zinc-WebSocket-Core')].
					
		spec project: 'Grease' with: [
			spec repository: seasideRepository.
			spec className: 'ConfigurationOfGrease'.
			spec file: 'ConfigurationOfGrease'.
			spec loads: #('Grease-Core' 'Grease-Pharo-Core' )].

		spec project: 'Seaside' with: [
			spec repository: seasideRepository.
			spec className: 'ConfigurationOfSeaside30'.
			spec file: 'ConfigurationOfSeaside30'.
			spec loads: #('Seaside-Pharo-Continuation' )].

		spec package: 'JSON' with: [
			spec repository: 'http://www.squeaksource.com/SCouchDB'].
			
		spec package: 'Phobos-Core' with: [spec requires: #('JSON') ].
		spec package: 'Phobos-XUL' with: [spec requires: #('Phobos-Core') ].
		spec package: 'Phobos-HTML' with: [spec requires: #('Phobos-Core') ].
		spec package: 'Phobos-Demo' with: [spec requires: #('Phobos-XUL' 'Phobos-HTML') ].
			
		spec group: 'default' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML' 'Phobos-Demo').
		spec group: 'demo' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML' 'Phobos-Demo').
		spec group: 'core' with: #('Phobos-Core' 'Phobos-XUL' 'Phobos-HTML').
	].
	
	spec for: #squeakCommon do: [
		].
   
      
        
