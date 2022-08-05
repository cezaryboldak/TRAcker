defaults
SPADefaultRequirements
	" return dictionary with default SPA requirements: requirement name -> requirement regular expression "	
		^ Dictionary newFromPairs: #(#Parent #(#Relations 'Parent\s*\(')  #ParentT #(#Relations 'Parent\*\s*\(') 
										#Follows #(#Relations 'Follows\s*\(') #FollowsT #(#Relations 'Follows\*\s*\(') 
										#Calls #(#Relations 'Calls\s*\(') #CallsT #(#Relations 'Calls\*\s*\(') 
										#Next #(#Relations 'Next\s*\(') #NextT #(#Relations 'Next\*\s*\(') 
										#Affects #(#Relations 'Affects\s*\(') #AffectsT #(#Relations 'Affects\*\s*\(') 
										#Modifies #(#Relations 'Modifies\s*\(') #Uses #(#Relations 'Uses\s*\(') 			
										#Boolean #(#Results 'boolean') #<> #(#Results '<.*,.*>') 
										#Pattern #(#Clauses '\s+pattern\s+') #With #(#Clauses '\s+with\s+') #_ #(#Clauses '_')
								)