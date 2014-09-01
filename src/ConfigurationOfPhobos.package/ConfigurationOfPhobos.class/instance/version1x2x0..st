baselines
version1x2x0: spec
	<version: '1.2.0' imports: #('1.1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec package: 'Phobos-Core' with: 'Phobos-Core-PavelKrivanek.30'. 
		spec package: 'Phobos-XUL' with: 'Phobos-XUL-PavelKrivanek.12'. 
		spec package: 'Phobos-HTML' with: 'Phobos-HTML-PavelKrivanek.2'. 
		spec package: 'Phobos-Demo' with: 'Phobos-Demo-PavelKrivanek.28'. 
		spec package: 'JSON' with: 'JSON-JesusMari.Stasenko.50'.
		spec project: 'ZincHTTPComponents' with:  '1.9.3'.
	].
