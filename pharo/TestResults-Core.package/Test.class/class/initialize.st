class initialization
initialize
	"initializes class variables, it should be called manually after every change !"

	Relations := Dictionary newFromPairs: #(#Parent 'Parent\s*\('  #ParentT 'Parent\*\s*\(' 
										#Follows 'Follows\s*\(' #FollowsT 'Follows\*\s*\(' 
										#Calls 'Calls\s*\(' #CallsT 'Calls\*\s*\(' 
										#Next 'Next\s*\(' #NextT 'Next\*\s*\(' 
										#Affects 'Affects\s*\(' #AffectsT 'Affects\*\s*\(' 
										#Modifies 'Modifies\s*\(' #Uses 'Uses\s*\(' 								
								)