initialization
createBrowser
	browser := GLMTabulator new.
	browser title: 'Tests'.
	browser 
		column: [ :c | c row: #relations span: 2 ; row: [ :r | r column: #size; column: #mode span: 2]  ];
		column: [ :c | c row: #diagrams span: 2; row: #characteristics ].
	browser transmit
		to: #relations;
		andShow: [ :composite |
			composite list
				beMultiple; allowDeselection;
				title: 'Relations';
				display: [ :dummy | Test relations keys ];
				format: [ :pair | pair]
			
			 ].
	browser transmit
		to: #size;
		andShow: [ :composite |
			composite list title: 'Size'; display: [ :dummy | #(1 2 3 4 5) ]
			 ].
	browser transmit
		to: #mode;
		andShow: [ :composite |
			composite list title: 'Mode'; display: [ :dummy | #(#NETTO #PLUS) ]
			 ].
	browser transmit 
		from: #relations; from: #size; from: #mode; to: #diagrams;
		andShow: [ :composite | 
			self transmitToDiagramsOn: composite
			].
	browser transmit 
		from: #diagrams; to: #characteristics;
		andShow: [ :composite | 
			self transmitToInfoOn: composite
			
			].

	^ browser