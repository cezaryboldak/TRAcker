rendering
renderInfoForReq: reqSet on: html
	html paragraph: [ 
		html strong: 'Reliability: '; text: (self class numberFormat: (self session testSession Reliability: reqSet)) greaseString.
		html strong: ' DBR: '; text: (self class numberFormat: (self session testSession DBR: reqSet asArray)) greaseString.
		html strong: ' DSI: '; text: (self class numberFormat: (self session testSession DSI: reqSet)) greaseString.
		html strong: ' DFE: '; text: (self class numberFormat: (self session testSession DFE: reqSet)) greaseString.
	]