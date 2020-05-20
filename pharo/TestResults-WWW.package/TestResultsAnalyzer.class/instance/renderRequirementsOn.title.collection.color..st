rendering
renderRequirementsOn: html title: aTitle collection: reqSet color: aColor
	html paragraph: [ 
		html div class: 'toggle',aColor; with: [ 
			html span: aTitle ; space. 
			reqSet asOrderedCollection sort;  do: [ :req | html mdlChip with: [  | reqText reqEnd |
																reqText := req greaseString.
																reqEnd := (reqText last = $T) ifTrue: [ 'T' ] ifFalse: [ '' ].
																html mdlChipContact hexColor: aColor ; with: (reqText at: 1) asString,reqEnd. 
																html mdlChipText: req greaseString ] ].
			html space.
			html mdlButton raised; primaryColor; rippleEffect;
					onClick: (html jQuery: 'div.toggle',aColor) toggle;
					with: 'Change'
	] ].
	html div class: 'toggle',aColor; style: 'display:none'; with: [ 
		html text: aTitle ; space. 
		html form: [
			(self session requirements) asOrderedCollection sort;  do: [ :req | 
				html mdlCheckboxLabel: req greaseString .
				html mdlCheckbox 
					value: (reqSet includes: req); 
					callback: [ :value  | value ifTrue: [ reqSet add: req ]
													ifFalse: [ (reqSet includes: req) ifTrue: [ reqSet remove: req ] ]  
													]  .
				html space.
			].
			html mdlButton raised; rippleEffect; with: 'Accept'
		].
	].
