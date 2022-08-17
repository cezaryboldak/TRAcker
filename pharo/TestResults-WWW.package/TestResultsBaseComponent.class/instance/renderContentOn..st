rendering
renderContentOn: html 
		html mdlGrid: [  
			self renderSubContentOn: html. 
		].
		html mdlFooter: [  
			html mdlFooterMiddleSection: [ 
				html mdlLogo: 'TRAcker 2'
			].
			html mdlFooterBottomSection: [ 
				html text: 'Copyright 2019-2022 '.
				html anchor url: 'mailto:c.boldak@pb.edu.pl'; with: 'Cezary Boldak'.
				html text: ', '.
				html anchor url: 'mailto:s.jarzabek@pb.edu.pl'; with: 'Stan Jarzabek'.
				html break.
				html anchor url: 'https://wi.pb.edu.pl'; with: 'Faculty of Computer Sciece'.
				html text: ' '.
				html anchor url: 'https://pb.edu.pl'; with: 'Bialystok University of Technology'
			]
		].
