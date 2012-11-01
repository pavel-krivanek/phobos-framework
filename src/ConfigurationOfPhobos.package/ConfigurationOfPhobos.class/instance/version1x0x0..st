baselines
version1x0x0: spec
	<version: '1.0.0' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec package: 'Phobos-Core' with: 'Phobos-Core-PavelKrivanek.25'. 
		spec package: 'Phobos-XUL' with: 'Phobos-XUL-PavelKrivanek.12'. 
		spec package: 'Phobos-HTML' with: 'Phobos-HTML-PavelKrivanek.2'. 
		spec package: 'Phobos-Demo' with: 'Phobos-Demo-PavelKrivanek.27'. 
		spec package: 'JSON' with: 'JSON-DieterRoth.Stasenko.38'.
		spec project: 'ZincHTTPComponents' with:  '1.9.3'.
		spec project: 'Grease' with: #stable.
		spec project: 'Seaside-Continuation' with: #stable.
	].
