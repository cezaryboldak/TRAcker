calculations
setSeries: series
	| centerLabel data baseline rPlus label |
	centerLabel := reqSet asRequirements .
	
	data := OrderedCollection new. 
	baseline := self session testSession baseline: reqSet asArray.
	baseline do: [ :baseReqSet |  | rel |
		rel := self session testSession Reliability: baseReqSet.
		label := baseReqSet asSet asRequirements.
		data add: (HighchartsSeriesSankeyData new  colorIndex: 200; from: label ;to: centerLabel; weight: 1; color: (self getRelColorString: rel); yourself).
		series nodes add: (HighchartsSeriesSankeyNodes new  colorIndex: 200; id: label; name: label; color: (self getRelColorString: rel); yourself).


		
	].
	rPlus := self session testSession rPlus: reqSet.
	rPlus do: [ :rPlusSet |  | rel |
		rel := self session testSession Reliability: rPlusSet.
		label := rPlusSet asSet asRequirements.
		data add: (HighchartsSeriesSankeyData new from: centerLabel ;to: label ; weight: 1; name: rel greaseString ;colorIndex: 200; color: (self getRelColorString: rel); yourself).
		series nodes add: (HighchartsSeriesSankeyNodes new  colorIndex: 200; id: label; name: label; color: (self getRelColorString: rel); yourself).

	].
	
	series data: data.


