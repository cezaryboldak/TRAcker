calculations
produceReqConfigurationData
	| myLabel data baseline rPlus series |
	myLabel := reqSet asRequirements .
	
	data := OrderedCollection new. 
	baseline := self session testSession baseline: reqSet asArray.
	baseline do: [ :baseReqSet |  | rel |
		rel := self session testSession Reliability: baseReqSet.
		data add: (HighchartsSeriesSankeyData new from: baseReqSet asSet asRequirements ;to: myLabel; weight: 1; color: (self getRelColorString: rel); yourself).

		
	].
	rPlus := self session testSession rPlus: reqSet.
	rPlus do: [ :rPlusSet |  | rel |
		rel := self session testSession Reliability: rPlusSet.
		data add: (HighchartsSeriesSankeyData new from: myLabel ;to: rPlusSet asRequirements ; weight: 1; name: rel greaseString ;colorIndex: 200; color: (self getRelColorString: rel); yourself)
	].
	
	^ data
