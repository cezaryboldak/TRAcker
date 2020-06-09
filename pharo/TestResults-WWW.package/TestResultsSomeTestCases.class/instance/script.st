hooks
script 
	^ 'function showHideTestsFn() { 
			var activeReqs = []; 
			$("span.includingReqsFilter.requirement-marked").each((index,elem)=>{activeReqs.push($(elem).children(".mdl-chip__text").text())});
			$("tr.test-case").addClass("requirement-hidden");
			$("tr.test-case").removeClass((index,classes)=>classes.split(" ").filter(cl=>activeReqs.includes(cl)).length>0?"requirement-hidden":"");

			activeReqs = [];
			$("span.excludingReqsFilter.requirement-marked").each((index,elem)=>{activeReqs.push($(elem).children(".mdl-chip__text").text())});
			$("tr.test-case").addClass((index,classes)=>classes.split(" ").filter(cl=>activeReqs.includes(cl)).length>0?"requirement-hidden":"");

			updateVisibleTests();
		}
		function updateVisibleTests() { 
			$("#testNumber").text($("tr.test-case:visible").length);
		}
	'