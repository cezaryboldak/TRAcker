constants
requirementsByCategory
	
	^ Array with: (OrderedDictionary newFrom: { #Relations -> (Set newFrom: #( #Next #NextT #Calls #CallsT #Follows #FollowsT #Parent #ParentT #Uses #Modifies #Affects #AffectsT)) .
																	#Results -> (Set newFrom: #( #Boolean #<>)).
																	#Clauses -> (Set newFrom: #(#Pattern #With #_)) })