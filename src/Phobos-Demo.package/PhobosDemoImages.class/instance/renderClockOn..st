as yet unclassified
renderClockOn: xml

	xml html: '
<svg:svg version="1.1" width="100" height="100" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2.02 2.02"> 
	<svg:defs>
		<svg:style type="text/css">
			path { 
				stroke: black; 
				stroke-width: 0.02; 
				fill: none; 
			} 
			line { 
				stroke-linecap: round; 
			} 
			#seconds { 
				stroke: red; 
				stroke-width: 0.02; 
			} 
			#minutes { 
				stroke: green; 
				stroke-width: 0.05; 
			} 
			#hours { 
				stroke: blue; 
				stroke-width: 0.08; 
			} 
		</svg:style>  
	</svg:defs>  
	<svg:g transform="rotate(-90) translate(-1,1)">  
		<svg:path d=" 
			M 1 0 A 1 1 0 1 1 -1 0 A 1 1 0 1 1 1 0 
			M 1.000 0.000 L 0.900 0.000 M 0.866 0.500 L 0.779 0.450 
			M 0.500 0.866 L 0.450 0.779 
			M 0.000 1.000 L 0.000 0.900 
			M -0.500 0.866 L -0.450 0.779 
			M -0.866 0.500 L -0.779 0.450 
			M -1.000 0.000 L -0.900 0.000 
			M -0.866 -0.500 L -0.779 -0.450 
			M -0.500 -0.866 L -0.450 -0.779 
			M 0.000 -1.000 L 0.000 -0.900 
			M 0.500 -0.866 L 0.450 -0.779 
			M 0.866 -0.500 L 0.779 -0.450 
		"/>  
		<svg:line id="hours" x1="0" y1="0" x2="0.40" y2="0"/>  
		<svg:line id="minutes" x1="0" y1="0" x2="0.65" y2="0"/> 
		<svg:line id="seconds" x1="0" y1="0" x2="0.90" y2="0"/>  
	</svg:g>  
	<svg:script>  
		var seconds = document.getElementById("seconds"); 
		var minutes = document.getElementById("minutes"); 
		var hours = document.getElementById("hours"); 
	
		function setClock(date) { 
			var s = (date.getSeconds() + date.getMilliseconds() / 1000) * Math.PI / 30; 
			var m = date.getMinutes() * Math.PI / 30 + s / 60; 
			var h = date.getHours() * Math.PI / 6 + m / 12; 

			seconds.setAttribute("x2", 0.90 * Math.cos(s)); 
			seconds.setAttribute("y2", 0.90 * Math.sin(s)); 
			minutes.setAttribute("x2", 0.65 * Math.cos(m)); 
			minutes.setAttribute("y2", 0.65 * Math.sin(m)); 
			hours .setAttribute("x2", 0.40 * Math.cos(h)); 
			hours .setAttribute("y2", 0.40 * Math.sin(h)); 
		} 
		setInterval("setClock(new Date())", 1000); 
	</svg:script> 
</svg:svg>	
	
	'