baselines
baseline: spec
	<baseline>

	spec for: #common do: [
		
	spec 
		baseline: 'Glorp' 
		with: [ spec repository: 'github://pavel-krivanek/glorp:8.3.1-23-baseline';
		onConflict: [ :e | e useIncoming ];
      ignoreImage;
		loads: 'Zinc-WebSocket-Core' ].
	
		spec 
			package: 'JSON';			
			package: 'Phobos-Core';
			package: 'Phobos-XUL';
			package: 'Phobos-HTML' ]