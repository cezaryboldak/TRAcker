rendering
renderRowsOn: html
	((position to: self indexOfLastRowToShow) collect: [ :rowIndex | rowsCache at: rowIndex ])
		do: [ :cells | | aId | aId := html nextId. html tableRow class: 'combinationRow'; onDoubleClick: 'document.location=$("#',aId asString,'")[0].href' ; class: (self classFor: cells); with: [ 
				html anchor callback: [ parentComponent showTestCasesFor: cells ]; style: 'display:none'; id: aId . self renderRowContentFor: cells on: html ] ]