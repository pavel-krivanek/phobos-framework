accessing
renderContentOn: aRenderer 

	self children do: [ :each | aRenderer render: each ]