baselines
baseline: spec
	<baseline>

	spec for: #common do: [
		
	spec 
		baseline: 'ZincHTTPComponents' 
		with: [ spec repository: 'github://svenvc/zinc/repository';
		loads: 'Zinc-WebSocket-Core' ].
	
		spec 
			package: 'JSON';			
			package: 'Phobos-Core';
			package: 'Phobos-XUL';
			package: 'Phobos-HTML' ]